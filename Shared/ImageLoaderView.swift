//
//  ImageLoaderView.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 31.03.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.0001)
            .overlay{
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
        
    }
}

#Preview {
    ImageLoaderView()
//        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
    }
