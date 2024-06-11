//
//  RecipeDetailViewModel.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 11/06/24.
//

import SwiftUI

@MainActor
final class RecipeDetailViewModel: ObservableObject {
    var recipe: Recipe
    var isFavorite: Bool {
        get {
            Persistence.shared.isRecipeFavorite(recipe: recipe)
        }
        set {
            let action: FavoritesAction = newValue ? .add : .remove
                
            Task {
                do {
                    try await Persistence.shared.updateFavorites(recipe: recipe, action: action)
                    objectWillChange.send()
                } catch {
                    print("erro")
                }
            }
        }
    }
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}
