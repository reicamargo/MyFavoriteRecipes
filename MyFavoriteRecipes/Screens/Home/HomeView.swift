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
        ScrollView(.vertical) {
            
            VStack(alignment: .leading) {
                
                Text("Featured")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                FeaturedScrollView(featuredRecipes: homeVM.featuredRecipes)
                
                Text("Categories")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                CategoriesScrollView()
                
                Text("All Recipes")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                RecipesScrollView(recipes: homeVM.allRecipes)
            }
        }
        .task {
            homeVM.allRecipes = await NetworkManager.shared.getRecipes()
        }
    }
}

#Preview {
    HomeView()
}
