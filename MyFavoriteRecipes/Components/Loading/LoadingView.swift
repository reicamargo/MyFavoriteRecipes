//
//  LoadingView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 07/06/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground.withAlphaComponent(0.8))
                .ignoresSafeArea()
            ProgressView("Loading...")
                .controlSize(.large)
                .font(.title2)
                .tint(.red)
        }
    }
}

#Preview {
    LoadingView()
}
