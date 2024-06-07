//
//  RecipesScrollView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct RecipesScrollView: View {
    var recipes: [Recipe]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(recipes, id: \.title) { recipe in
                    NavigationLink(value: recipe) {
                        VStack {
                            AsyncImage(url: recipe.imageURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .containerRelativeFrame(.horizontal) { width, _ in
                                        width * 0.4
                                    }
                            } placeholder: {
                                Image(.recipeMock)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .containerRelativeFrame(.horizontal) { width, _ in
                                        width * 0.4
                                    }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(radius: 2)
                            .overlay(alignment: .bottom) {
                                ZStack {
                                    Rectangle()
                                        .fill(.white.opacity(0.8))
                                        .frame(height: 40)
                                        .clipShape(.rect(bottomLeadingRadius: 12, bottomTrailingRadius: 12))
                                    Text(recipe.title)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                        .truncationMode(.tail)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    RecipesScrollView(recipes: Recipe.mockRecipes)
}
