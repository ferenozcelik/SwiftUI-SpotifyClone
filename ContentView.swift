//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Fatih Eren Ozcelik on 31.03.2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(products) { product in
                    Text(product.title)
                        .foregroundStyle(.spotifyGreen)
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await NetworkManager().getUsers()
            products = try await NetworkManager().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
