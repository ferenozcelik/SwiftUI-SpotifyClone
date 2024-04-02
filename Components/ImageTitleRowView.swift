//
//  ImageTitleRowView.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 2.04.2024.
//

import SwiftUI

struct ImageTitleRowView: View {
    
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some title"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowView()
    }
}
