//
//  CategoriesView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct CategoriesView: View {
    @State var categorySelected: Categories
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    CategoriesView(categorySelected: .All)
}
