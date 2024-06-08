//
//  RecipeScrollView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 08/06/24.
//

import SwiftUI

struct RecipeScrollView: View {
    var sectionTitle: String
    var recipes: [Recipe]
    var featuredSection: Bool
    
    var body: some View {
        Text(sectionTitle)
            .font(.title)
            .fontWeight(.semibold)
            .padding(.leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(recipes, id:\.title) { recipe in
                    RecipeCellView(recipe: recipe, isFeatured: featuredSection)
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    RecipeScrollView(sectionTitle: "Featured", recipes: Recipe.mockRecipes, featuredSection: true)
}
