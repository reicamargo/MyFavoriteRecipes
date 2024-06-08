//
//  CategoriesScrollView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct CategoriesScrollView: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                ForEach(Categories.allCases, id: \.hashValue) { category in
                    Button {
                        
                    } label: {
                        HStack {
                            Image(category.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.categoriesIcon)
                                .frame(width: 30)
                            
                            Text("\(category.rawValue)")
                                .font(.headline)
                        }
                        .frame(width: 140, height: 50)
                        .background(.categoriesBackground.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .foregroundStyle(.primary)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .padding(.bottom)
    }
}

#Preview {
    CategoriesScrollView()
}
