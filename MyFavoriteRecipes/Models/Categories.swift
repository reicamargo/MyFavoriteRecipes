//
//  Categories.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import Foundation

enum Categories: String, CaseIterable {
    case Breakfast = "Breakfast"
    case Lunch = "Lunch"
    case Dinner = "Dinner"
    case Dessert = "Dessert"
    case Snacks = "Snacks"
    case Drinks = "Drinks"
    case Bakery = "Bakery"
    case All = "All"
    
    var icon: String {
        self.rawValue.lowercased()
    }
}
