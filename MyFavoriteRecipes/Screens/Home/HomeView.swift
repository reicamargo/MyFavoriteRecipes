//
//  Home.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical) {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Featured")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            RecipeCellView(recipes: homeVM.featuredRecipes, featured: true)
                        }
                        
                        Text("Categories")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        CategoriesScrollView()
                        
                        Text("Recipes")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            RecipeCellView(recipes: homeVM.recipes, featured: false)
                        }
                    }
                }
                .task {
                    await homeVM.loadRecipes()
                }
                
                if homeVM.isLoading {
                    LoadingView()
                }
            }
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
    }
}

#Preview {
    HomeView()
}
