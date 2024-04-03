//
//  PlaylistView.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 2.04.2024.
//

import SwiftUI

struct PlaylistView: View {
    
    var product: Product = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderView(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand,
                        imageName: product.thumbnail
                    )
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    PlaylistView()
}
