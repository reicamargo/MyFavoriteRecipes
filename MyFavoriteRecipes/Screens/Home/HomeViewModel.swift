//
//  HomeViewModel.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var allRecipes = [Recipe]()
    
    var featuredRecipes: [Recipe] {
        allRecipes.filter { $0.featured == true }
    }
    
    init() {
        
    }
}
