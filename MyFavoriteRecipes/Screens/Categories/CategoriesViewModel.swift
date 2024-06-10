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
        recipes = await Network.shared.getRecipes()
        
        isLoading = false
    }
    
}
