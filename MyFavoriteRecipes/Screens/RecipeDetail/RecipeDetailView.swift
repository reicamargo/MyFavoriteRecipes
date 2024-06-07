//
//  RecipeDetail.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 07/06/24.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
                AsyncImage(url: recipe.imageURL, content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }, placeholder: {
                    Image(.recipeMock)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                })
                .overlay(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    ZStack {
                        Circle()
                            .fill(.black.opacity(0.6))
                            .frame(width: 60)
                        Image(Categories(rawValue: recipe.category)?.icon ?? "backery")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.yellow)
                            .frame(width: 40)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
            
            Form {
                Section("Preparation time") {
                    Text(recipe.preparationTime)
                }
                
                Section("Ingredients") {
                    List(recipe.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
                
                Section("Instructions") {
                    List(recipe.instructions, id: \.self) { instruction in
                        Text(instruction)
                    }
                }
            }
        }
        .navigationTitle(recipe.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeDetailView(recipe: .mockRecipe)
}
