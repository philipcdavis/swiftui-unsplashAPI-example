//
//  ContentView.swift
//  UnsplashAPI
//
//  Created by Philip Davis on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var randomImages = UnsplashData()
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(randomImages.photoArray, id: \.id) { photo in
                        AsyncImage(url: URL(string: photo.urls["regular"]!)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.1)
                        }
                    }
                }
            }.navigationBarTitle("Unsplash API")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
