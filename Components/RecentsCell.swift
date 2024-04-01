//
//  RecentsCell.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 1.04.2024.
//

import SwiftUI

struct RecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some Title Example"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            HStack {
                RecentsCell()
                RecentsCell()
            }
            HStack {
                RecentsCell()
                RecentsCell()
            }
        }
    }
}
