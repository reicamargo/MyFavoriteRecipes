//
//  AlertItem.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 11/06/24.
//

import SwiftUI

struct AlertItem {
    let id = UUID()
    var title = "Error"
    var message = Text("")
    var showAlert: Bool = false
    
    mutating func set(title: String, message: String) {
        self.title = title
        self.message = Text(message)
        self.showAlert = true
    }
}
