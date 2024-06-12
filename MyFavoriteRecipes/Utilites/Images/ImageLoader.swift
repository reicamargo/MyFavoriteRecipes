//
//  ImageLoader.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 12/06/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    @MainActor
    func load(fromURLString urlString: String) {
        Task {
            let uiImage = await Network.shared.downloadImage(fromURLString: urlString)
            guard let uiImage else { return }
            
            image = Image(uiImage: uiImage)
        }
    }
}
