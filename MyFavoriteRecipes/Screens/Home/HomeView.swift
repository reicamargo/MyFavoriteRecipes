//
//  Home.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    @EnvironmentObject var recipeCategory: Category
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical) {
                    
                    VStack(alignment: .leading) {
                        
                        RecipeScrollView(sectionTitle: "Featured", recipes: homeVM.featuredRecipes, featuredSection: true)
                        
                        Text("Categories")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        CategoriesScrollView() { selectedCategory in
                            recipeCategory.selected = selectedCategory
                            Router.shared.selectedTab = .categories
                        }
                        
                        RecipeScrollView(sectionTitle: "All Recipes", recipes: homeVM.recipes, featuredSection: false)
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
