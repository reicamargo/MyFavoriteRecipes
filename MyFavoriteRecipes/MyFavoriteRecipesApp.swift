//
//  MyFavoriteRecipesApp.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

@main
struct MyFavoriteRecipesApp: App {
    var category = Category()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(Router.shared)
                .environmentObject(category)
        }
    }
}
