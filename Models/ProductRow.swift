//
//  ProductRow.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 2.04.2024.
//

import Foundation

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
    
}
