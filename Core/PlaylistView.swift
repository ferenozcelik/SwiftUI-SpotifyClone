//
//  PlaylistView.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 2.04.2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct PlaylistView: View {
    
    @Environment(\.router) var router
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
    
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
                    // proper way of wrapping with GeometryReader without causing frames to change
                    /*
                    .background(
                        GeometryReader(content: { geometry in
                            Text("")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        })
                    )
                    */
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150 ? true : false
                    }
                    
                    PlaylistDescriptionView(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        SongRowView(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onSongPressed: {
                                goToPlaylistView(product: product)
                            },
                            onEllipsisPressed: {
                                
                            }
                        )
                        .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            header
                .frame(maxHeight: .infinity, alignment: .top)

        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    
}

#Preview {
    RouterView { _ in
        PlaylistView()
    }
}

private extension PlaylistView {
    
    var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(.spotifyBlack)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ?
                    .black.opacity(0.0001) : .spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
}

private extension PlaylistView {
    
    func getData() async {
        do {
            products = try await NetworkManager().getProducts()
        } catch {
            
        }
    }
    
    func goToPlaylistView(product: Product) {
        router.showScreen(.push) { _ in
            PlaylistView(product: product, user: user)
        }
    }
}
