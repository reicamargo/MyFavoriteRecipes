//
//  Recipe.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import Foundation

struct Recipe: Codable, Hashable {
    let title: String
    let preparationTime: String
    let image: String
    let category: String
    let featured: Bool
    let ingredients: [String]
    let instructions: [String]
    
    var imageURL: URL? {
        URL(string: image)
    }
    
    
    static let mockRecipe = Recipe(title: "Easy Pizza Toast do rei free",
                                   preparationTime: "Prep: 25 mins",
                                   image: "https://www.warburtonsglutenfree.com/files/pizza_toast.jpg",
                                   category: "Snacks",
                                   featured: true,
                                   ingredients: ["Bread of your choice", "Pizza sauce", "Mozzarella cheese", "Pepperoni/salami", "Oregano"],
                                   instructions: [
                                    "Toast the bread: Pop sliced bread into a toaster or alternative toast under the grill/broiler of your oven on both sides.",
                                    "Add toppings: Place slices of toasted bread onto a rimmed baking sheet. Top the toast with pizza sauce. Scatter over grated or shredded mozzarella cheese and top with your choice of toppings. Sprinkle over dried oregano and place in a hot oven.",
                                    "Bake: Allow to cook until the cheese has melted then remove from the oven and serve."])
    static let mockRecipes = [mockRecipe, mockRecipe, mockRecipe, mockRecipe]
}

struct RecipeResponse: Codable {
    let record: Record
}

struct Record: Codable {
    let recipes: [Recipe]
}

