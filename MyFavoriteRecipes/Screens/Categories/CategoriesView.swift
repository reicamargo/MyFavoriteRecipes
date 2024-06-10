//
//  CategoriesView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var recipeCategory: Category
    @StateObject var categoriesVM: CategoriesViewModel = CategoriesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                CategoriesScrollView() { selectedCategory in
                    recipeCategory.selected = selectedCategory
                    categoriesVM.selectedCategory = selectedCategory
                }
                .padding(.top)
                
                ZStack {
                    
                    List(categoriesVM.filteredRecipes, id: \.title) { recipe in
                        NavigationLink(value: recipe) {
                            HStack {
                                AsyncImage(url: recipe.imageURL, content: { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                    
                                }, placeholder: {
                                    LoadingView()
                                        .frame(width: 90, height: 60)
                                })
                                .frame(width: 90,height: 60)
                                
                                VStack {
                                    Text(recipe.title)
                                        .font(.body)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                        .truncationMode(.tail)
                                    
                                    Text(recipe.category)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    .listRowSpacing(8)
                    .navigationDestination(for: Recipe.self) { recipe in
                        RecipeDetailView(recipe: recipe)
                    }
                    
                    if categoriesVM.isLoading {
                        LoadingView()
                    }
                }
            }
            .task {
                await categoriesVM.loadRecipes(selectedCategory: recipeCategory.selected)
            }
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoriesView(categoriesVM: CategoriesViewModel())
        .environmentObject(Category())
}
