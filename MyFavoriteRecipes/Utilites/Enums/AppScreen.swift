//
//  AppScreen.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 08/06/24.
//

import SwiftUI

enum AppScreen: Hashable, Identifiable, CaseIterable {
    case home, categories, favorites
    
    var id: AppScreen { self }
}

extension AppScreen {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .home:
            Label("Home", systemImage: "house")
        case .categories:
            Label("Categories", systemImage: "tray.full")
        case .favorites:
            Label("Favorites", systemImage: "heart")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            HomeView()
        case .categories:
            CategoriesView()
        case .favorites:
            FavoritesView()
        }
    }
}
