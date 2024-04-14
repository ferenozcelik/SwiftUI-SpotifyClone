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
    
    @Environment(\.router) var router
    
    var body: some View {
        List {
            Button("Open spotify") {
                router.showScreen(.fullScreenCover) { _ in
                    HomeView()
                }
            }
        }
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
