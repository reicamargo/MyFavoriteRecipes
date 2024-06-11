//
//  Favorite.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 11/06/24.
//

import Foundation

struct Favorite: Codable {
    var recipes: [Recipe]
    
    init() {
        recipes = [Recipe]()
    }
}
