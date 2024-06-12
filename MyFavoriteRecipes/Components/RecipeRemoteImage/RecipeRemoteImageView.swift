//
//  RecipeRemoteImageView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 12/06/24.
//

import SwiftUI

struct RecipeRemoteImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImageView(image: imageLoader.image, imagePlaceholder: .recipePlaceholder)
            .foregroundStyle(.categoriesIcon)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}

#Preview {
    RecipeRemoteImageView(urlString: "")
}
