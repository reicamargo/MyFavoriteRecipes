//
//  HomeViewModel.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var allRecipes = [Recipe]()
    @Published var isLoading = true
    
    var featuredRecipes: [Recipe] {
        allRecipes.filter { $0.featured == true }
    }
    
    init() {
        
    }
    
    func loadRecipes() async {
        isLoading = true
        
        allRecipes = await NetworkManager.shared.getRecipes()
        
        isLoading = false
    }
}
