//
//  FeaturedScrollView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct FeaturedScrollView: View {
    var featuredRecipes: [Recipe]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(featuredRecipes, id:\.title) { featuredRecipe in
                    NavigationLink(value: featuredRecipe) {
                        ZStack {
                            AsyncImage(url: featuredRecipe.imageURL, content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .containerRelativeFrame(.horizontal) { width, _ in
                                        width * 0.8
                                    }
                                
                            }, placeholder: {
                                Image(.recipeMock)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .containerRelativeFrame(.horizontal) { width, _ in
                                        width * 0.8
                                    }
                            })
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 3)
                            .overlay(alignment: .bottom) {
                                ZStack {
                                    Rectangle()
                                        .fill(.white.opacity(0.8))
                                        .frame(height: 80)
                                        .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                                    
                                    VStack {
                                        Text(featuredRecipe.title)
                                            .font(.headline)
                                            .foregroundStyle(.black)
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                        
                                        Text(featuredRecipe.preparationTime)
                                            .font(.subheadline)
                                            .foregroundStyle(.black)
                                    }
                                    
                                }
                            }
                        }
                        .padding(.trailing, 8)
                    }
                }
            }
            .scrollTargetLayout()
            .padding(.bottom)
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    FeaturedScrollView(featuredRecipes: Recipe.mockRecipes)
}
