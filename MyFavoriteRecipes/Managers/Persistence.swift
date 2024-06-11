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
    
    func getFavorites() throws -> [Recipe] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try JSONDecoder().decode([Recipe].self, from: data)
        } catch {
            throw PersistenceErrors.unableToLoadFavorites
        }
    }
    
    func isRecipeFavorite(recipe: Recipe) -> Bool {
        do {
            let favorites = try getFavorites()
            return favorites.contains(recipe)
        } catch {
            return false
        }
    }
    
    
    private func saveFavorites(favorites: [Recipe]) async throws {
        do {
            let encodedFavorite = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(encodedFavorite, forKey: key)
            return
        } catch {
            throw PersistenceErrors.unableToSave
        }
    }
    
    func updateFavorites(recipe: Recipe, action: FavoritesAction) async throws {
        var favorites = try getFavorites()
        
        if action == .add {
            guard !favorites.contains(recipe) else { throw PersistenceErrors.recipeAlreadyExists }
            
            favorites.append(recipe)
        } else {
            guard let index = favorites.firstIndex(of: recipe) else { throw PersistenceErrors.indexNotFound }
            favorites.remove(at: index)
        }
        
        try await saveFavorites(favorites: favorites)
    }
    
    func removeFavorites(attOffsets indexOffset: IndexSet) async throws {
        var favorites = try getFavorites()
        favorites.remove(atOffsets: indexOffset)
        
        try await saveFavorites(favorites: favorites)
    }
}

enum PersistenceErrors: String, Error {
    case unableToLoadFavorites = "Unable to load favorites..."
    case recipeAlreadyExists = "This recipe already exists. You must really love this recipe!"
    case indexNotFound = "Index not found"
    case unableToSave = "Couldn't save..."
}
