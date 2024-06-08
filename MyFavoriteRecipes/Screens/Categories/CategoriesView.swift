//
//  CategoriesView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var acategory: Category
    
    var body: some View {
        switch acategory.selected {
        case .All:
            Text("Choosen category: All")
        default:
            Text("Choosen category: other")
        }
        
    }
}

#Preview {
    CategoriesView()
        .environmentObject(Category())
}
