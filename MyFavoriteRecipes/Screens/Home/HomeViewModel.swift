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
    
    var featuredRecipes: [Recipe] {
        recipes.filter { $0.featured == true }
    }
    
    init() {
        
    }
    
    func loadRecipes() async {
        isLoading = true
        
        recipes = await Network.shared.getRecipes()
        
        isLoading = false
    }
}
