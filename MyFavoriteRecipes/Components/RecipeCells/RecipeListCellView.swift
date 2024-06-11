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
            .padding(.trailing)
            
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Label {
                    Text(recipe.category)
                        .font(.subheadline)
                } icon: {
                    Image(Categories(rawValue: recipe.category)?.icon ?? "allCategories")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.categoriesIcon)
                        .frame(width: 30)
                }
            }
        }
    }
}

#Preview {
    RecipeListCellView(recipe: .mockRecipe)
}
