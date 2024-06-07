//
//  RecipeGridCellView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 07/06/24.
//

import SwiftUI

struct RecipeCellView: View {
    var recipes: [Recipe]
    var featured: Bool
    
    var body: some View {
        
            HStack {
                ForEach(recipes, id:\.title) { recipe in
                    NavigationLink(value: recipe) {
                        ZStack {
                            AsyncImage(url: recipe.imageURL, content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .containerRelativeFrame(.horizontal) { width, _ in
                                        width * (featured ? 0.9 : 0.5)
                                    }
                                
                            }, placeholder: {
                                Image(.recipeMock)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .containerRelativeFrame(.horizontal) { width, _ in
                                        width * (featured ? 0.8 : 0.4)
                                    }
                            })
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 3)
                            .overlay(alignment: .bottom) {
                                ZStack {
                                    Rectangle()
                                        .fill(.white.opacity(0.8))
                                        .frame(height: featured ? 80 : 50)
                                        .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                                    
                                    VStack {
                                        Text(recipe.title)
                                            .font(featured ? .headline : .subheadline)
                                            .foregroundStyle(.black)
                                            .lineLimit(featured ? 1 : 2)
                                            .multilineTextAlignment(.center)
                                            .truncationMode(.tail)
                                            .padding(.horizontal)
                                        
                                        if featured {
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
            .padding(.bottom)
    }
}

#Preview {
    RecipeCellView(recipes: Recipe.mockRecipes, featured: true)
}
