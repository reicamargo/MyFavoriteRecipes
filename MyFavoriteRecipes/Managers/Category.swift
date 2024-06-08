//
//  Category.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 08/06/24.
//

import Foundation

final class Category: ObservableObject {
    @Published var selected: Categories
    
    init() {
        selected = .All
    }
}
