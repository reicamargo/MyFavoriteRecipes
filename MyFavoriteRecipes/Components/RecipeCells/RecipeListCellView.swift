//
//  RecipeListCellView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 11/06/24.
//

import SwiftUI

struct RecipeListCellView: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            AsyncImage(url: recipe.imageURL, content: { image in
                image
                    .resizable()
            }, placeholder: {
                LoadingView()
                    .frame(width: 100, height: 80)
            })
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 100, height: 80)
            
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

#Preview {
    RecipeListCellView(recipe: .mockRecipe)
}
