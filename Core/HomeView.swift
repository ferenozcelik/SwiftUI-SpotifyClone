//
//  HomeView.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 31.03.2024.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 0,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        VStack(spacing: 16) {
                            recentsSection
                                .padding(.horizontal, 16)
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRows
                        }
//                        .padding(.horizontal, 16)
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView()
}

private extension HomeView {
    
    func getData() async {
        do {
            currentUser = try await NetworkManager().getUsers().first
            products = try await Array(NetworkManager().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand }) // unique brands
            for brand in allBrands {
//                let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
        } catch {
            
        }
    }
}

private extension HomeView {
    
    var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                } else {
                    ProgressView()
                        .tint(.white)
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryView(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
    
    var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                RecentsView(imageName: product.firstImage, title: product.title)
                    .asButton(.press) {
                        
                    }
            }
        }
    }
    
    func newReleaseSection(product: Product) -> some View {
        NewReleaseView(
            imageName: product.firstImage,
            headline: product.brand,
            subHeadline: product.category,
            title: product.title,
            subTitle: product.description,
            onAddToPlaylistPressed: {
                
            },
            onPlayPressed: {
                
            }
        )
    }
    
    var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.products) { product in
                            ImageTitleRowView(
                                imageSize: 120,
                                imageName: product.firstImage,
                                title: product.title
                            )
                            .asButton(.press) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}
