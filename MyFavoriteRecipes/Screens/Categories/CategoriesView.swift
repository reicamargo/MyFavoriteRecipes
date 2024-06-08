//
//  CategoriesView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct CategoriesView: View {
    @State var categorySelected: Categories = .All
    
    var body: some View {
        Text("Choosen category: \(categorySelected.rawValue)")
    }
}

#Preview {
    CategoriesView()
}
