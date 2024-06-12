//
//  RemoteImageView.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 12/06/24.
//

import SwiftUI

struct RemoteImageView: View {
    var image: Image?
    var imagePlaceholder: ImageResource
    
    var body: some View {
        image?.resizable() ?? Image(imagePlaceholder).resizable()
    }
}

#Preview {
    RemoteImageView(image: nil, imagePlaceholder: .recipePlaceholder)
}
