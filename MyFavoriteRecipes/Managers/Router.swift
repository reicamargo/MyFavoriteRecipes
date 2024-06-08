//
//  Router.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 08/06/24.
//

import Foundation

final class Router: ObservableObject {
    static let shared = Router()
    @Published var selectedTab: AppScreen = .home
    
    private init() { }
}
