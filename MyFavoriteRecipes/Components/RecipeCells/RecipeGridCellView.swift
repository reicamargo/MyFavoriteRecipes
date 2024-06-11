//
//  RecipeGridCellView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 07/06/24.
//

import SwiftUI

struct RecipeGridCellView: View {
    var recipe: Recipe
    var isFeatured: Bool
    
    var body: some View {
        
        NavigationLink(value: recipe) {
            ZStack {
                AsyncImage(url: recipe.imageURL, content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .containerRelativeFrame(.horizontal) { width, _ in
                            width * (isFeatured ? 0.9 : 0.5)
                        }
                    
                }, placeholder: {
                    LoadingView()
                        .frame(width: isFeatured ? 350 : 200, height: isFeatured ? 318 : 296)
                })
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 3)
                .overlay(alignment: .bottom) {
                    ZStack {
                        Rectangle()
                            .fill(.white.opacity(0.8))
                            .frame(height: isFeatured ? 80 : 50)
                            .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                        
                        VStack {
                            Text(recipe.title)
                                .font(isFeatured ? .headline : .subheadline)
                                .foregroundStyle(.black)
                                .lineLimit(isFeatured ? 1 : 2)
                                .multilineTextAlignment(.center)
                                .truncationMode(.tail)
                                .padding(.horizontal)
                            
                            if isFeatured {
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
    RecipeGridCellView(recipe: Recipe.mockRecipe, isFeatured: true)
}
