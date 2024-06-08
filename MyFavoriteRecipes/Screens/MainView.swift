//
//  ContentView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(AppScreen.allCases, id: \.id) { screenTab in
                screenTab.destination
                    .tabItem { screenTab.label }
                    .tag(screenTab.id)
            }
        }
    }
}

#Preview {
    MainView()
}
