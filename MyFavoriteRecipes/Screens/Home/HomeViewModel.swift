//
//  HomeViewModel.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    @Published var isLoading = true
    @Published var alertItem = AlertItem()
    
    var featuredRecipes: [Recipe] {
        recipes.filter { $0.featured == true }
    }
    
    func loadRecipes() async {
        isLoading = true
        
        do {
            recipes = try await Network.shared.getRecipes()
            isLoading = false
        } catch {
            isLoading = false
            if let networkError = error as? NetworkError {
                
                alertItem.set(title: "Something went wrong", message: networkError.description)
            } else {
                alertItem.set(title: "Something went wrong", message: "Unable to connect to the server. Please try again later.")
            }
            
        }
    }
}
