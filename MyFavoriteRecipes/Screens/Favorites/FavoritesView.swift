//
//  FavoritesView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var favoriteVM = FavoriteViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(favoriteVM.favorites, id: \.title) { favorite in
                        NavigationLink(value: favorite) {
                            RecipeListCellView(recipe: favorite)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        withAnimation {
                            favoriteVM.removeFromFavorite(attOffsets: indexSet)
                        }
                    })
                }
                .listRowSpacing(8)
                .navigationDestination(for: Recipe.self) { favorite in
                    RecipeDetailView(recipe: favorite)
                }
                
                if favoriteVM.isLoading {
                    LoadingView()
                }
            }
            .task {
                favoriteVM.loadFavorites()
            }
            .navigationTitle("My Favorites")
        }
    }
}

#Preview {
    FavoritesView()
}
