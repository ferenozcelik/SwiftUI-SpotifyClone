//
//  SongRowView.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 7.04.2024.
//

import SwiftUI

struct SongRowView: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some title"
    var subtitle: String? = "Some subtitle"
    var onSongPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(.black.opacity(0.0001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .background(.black.opacity(0.0001))
        .onTapGesture {
            onSongPressed?()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            SongRowView()
            SongRowView()
            SongRowView()
            SongRowView()
        }
    }
}
