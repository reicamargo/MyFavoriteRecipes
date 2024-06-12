//
//  RecipeDetail.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 07/06/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var recipeDetailVM: RecipeDetailViewModel
    
    var body: some View {
        VStack {
            RecipeRemoteImageView(urlString: recipeDetailVM.recipe.image)
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 8)
                .overlay(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    ZStack {
                        Circle()
                            .fill(.black.opacity(0.6))
                            .frame(width: 60)
                        Image(Categories(rawValue: recipeDetailVM.recipe.category)?.icon ?? "backery")
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
                    Text(recipeDetailVM.recipe.preparationTime)
                }
                
                Section("Ingredients") {
                    List(recipeDetailVM.recipe.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
                
                Section("Instructions") {
                    List(recipeDetailVM.recipe.instructions, id: \.self) { instruction in
                        Text(instruction)
                    }
                }
            }
        }
        .navigationTitle(recipeDetailVM.recipe.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                recipeDetailVM.isFavorite.toggle()
            } label: {
                Image(systemName: recipeDetailVM.isFavorite ? "heart.fill" : "heart")
            }
        }
    }
    
    init(recipe: Recipe) {
        self.recipeDetailVM = RecipeDetailViewModel(recipe: recipe)
    }
}

#Preview {
    RecipeDetailView(recipe: .mockRecipe)
}
