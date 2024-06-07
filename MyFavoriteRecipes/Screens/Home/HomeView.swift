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
                        
                        FeaturedScrollView(featuredRecipes: homeVM.featuredRecipes)
                        
                        Text("Categories")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        CategoriesScrollView()
                        
                        Text("All Recipes")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        RecipesScrollView(recipes: homeVM.allRecipes)
                    }
                }
                .task {
                    await homeVM.loadRecipes()
                }
                
                if homeVM.isLoading {
                    LoadingView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
