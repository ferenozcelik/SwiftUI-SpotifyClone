//
//  PlaylistHeaderView.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 3.04.2024.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderView: View {
    
    var height: CGFloat = 300
    var title: String = "Some playlist title"
    var subtitle: String = "Some subtitle"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                ImageLoaderView(urlString: imageName)
            )
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [shadowColor.opacity(0), shadowColor],
                        startPoint: .top, endPoint: .bottom
                    )
                )
            }
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderView()
        }
        .ignoresSafeArea()
    }
}
