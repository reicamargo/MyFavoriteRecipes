//
//  RecipeGridCellView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 07/06/24.
//

import SwiftUI

struct RecipeCellView: View {
    var recipe: Recipe
    var cellFeatured: Bool
    
    var body: some View {
        
        NavigationLink(value: recipe) {
            ZStack {
                AsyncImage(url: recipe.imageURL, content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .containerRelativeFrame(.horizontal) { width, _ in
                            width * (cellFeatured ? 0.9 : 0.5)
                        }
                    
                }, placeholder: {
                    Image(.recipeMock)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .containerRelativeFrame(.horizontal) { width, _ in
                            width * (cellFeatured ? 0.8 : 0.4)
                        }
                })
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 3)
                .overlay(alignment: .bottom) {
                    ZStack {
                        Rectangle()
                            .fill(.white.opacity(0.8))
                            .frame(height: cellFeatured ? 80 : 50)
                            .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                        
                        VStack {
                            Text(recipe.title)
                                .font(cellFeatured ? .headline : .subheadline)
                                .foregroundStyle(.black)
                                .lineLimit(cellFeatured ? 1 : 2)
                                .multilineTextAlignment(.center)
                                .truncationMode(.tail)
                                .padding(.horizontal)
                            
                            if cellFeatured {
                                Text(recipe.preparationTime)
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                            }
                        }
                        
                    }
                }
            }
            .padding(.trailing, 8)
        }
    }
}

#Preview {
    RecipeCellView(recipe: Recipe.mockRecipe, cellFeatured: true)
}
