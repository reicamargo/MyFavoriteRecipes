//
//  Persistence.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 11/06/24.
//

import Foundation

final class Persistence {
    static var shared = Persistence()
    private var key = "favoriteRecipes"
    
    private init() { }
    
    func getFavorites() -> Favorite {
        guard let data = UserDefaults.standard.data(forKey: key) else { return Favorite() }
        
        guard let favorites = try? JSONDecoder().decode(Favorite.self, from: data) else { return Favorite() }
        
        return favorites
    }
    
    func isRecipeFavorite(recipe: Recipe) -> Bool {
        let favorites = getFavorites()
        return favorites.recipes.contains(recipe)
    }
    
    
    private func saveFavorites(favorites: Favorite) async throws {
        do {
            let encodedFavorite = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(encodedFavorite, forKey: key)
            return
        } catch {
            throw PersistenceErrors.unableToSave
        }
    }
    
    func updateFavorites(recipe: Recipe, action: FavoritesAction) async throws {
        var favorites = getFavorites()
        
        if action == .add {
            guard !favorites.recipes.contains(recipe) else { throw PersistenceErrors.recipeAlreadyExists }
            
            favorites.recipes.append(recipe)
        } else {
            guard let index = favorites.recipes.firstIndex(of: recipe) else { throw PersistenceErrors.indexNotFound }
                
            favorites.recipes.remove(at: index)
        }
        
        try await saveFavorites(favorites: favorites)
    }
}

enum FavoritesAction {
    case add, remove
}

enum PersistenceErrors: String, Error {
    case recipeAlreadyExists = "This recipe already exists. You must really love this recipe!"
    case indexNotFound = "Index not found"
    case unableToSave = "Couldn't save..."
}
