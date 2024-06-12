//
//  CategoriesViewModel.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 08/06/24.
//

import SwiftUI

final class CategoriesViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var selectedCategory: Categories = .All
    @Published var alertItem = AlertItem()
    
    var recipes = [Recipe]()
    
    var filteredRecipes: [Recipe] {
        if selectedCategory == .All {
            return recipes
        }
        
        return recipes.filter { $0.category == selectedCategory.rawValue }
    }
    
    @MainActor
    func loadRecipes(selectedCategory: Categories = .All) async {
        isLoading = true
        self.selectedCategory = selectedCategory
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
