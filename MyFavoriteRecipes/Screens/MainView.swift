//
//  ContentView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            RecipesView()
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet.clipboard")
                }
            CategoriesView(categorySelected: .All)
                .tabItem {
                    Label("Categories", systemImage: "tray.full")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    MainView()
}
