//
//  FavoriteViewModel.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 11/06/24.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
    @Published var favorites: [Recipe] = []
    @Published var isLoading = true
    
    func loadFavorites() {
        isLoading = true
        
        do {
            favorites = try Persistence.shared.getFavorites()
            isLoading = false
        } catch {
            isLoading = false
            print("erro")
        }
    }
    
    @MainActor
    func removeFromFavorite(attOffsets indexOffset: IndexSet) {
        Task {
            do {
                try await Persistence.shared.removeFavorites(attOffsets: indexOffset)
                favorites.remove(atOffsets: indexOffset)
                
            } catch {
                print("erro")
            }
        }
    }
}
