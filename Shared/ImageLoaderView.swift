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
        Text("Hello World")
        
    }
}

#Preview {
    ImageLoaderView()
//        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
    }
