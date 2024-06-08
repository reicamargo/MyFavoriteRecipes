//
//  Categories.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 08/06/24.
//

import Foundation

enum Categories: String, CaseIterable {
    case All = "All"
    case Breakfast = "Breakfast"
    case Lunch = "Lunch"
    case Dinner = "Dinner"
    case Dessert = "Dessert"
    case Snacks = "Snacks"
    case Drinks = "Drinks"
    case Bakery = "Bakery"
    
    var icon: String {
        let rawValue = self.rawValue.lowercased()
        return rawValue == "all" ? "allCategories" : rawValue
    }
}
