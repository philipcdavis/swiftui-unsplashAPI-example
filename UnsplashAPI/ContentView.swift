//
//  ContentView.swift
//  UnsplashAPI
//
//  Created by Philip Davis on 1/25/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var randomImages = UnsplashData()
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(randomImages.photoArray, id: \.id) { photo in
                        WebImage(url: URL(string: photo.urls["regular"]!))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }.navigationBarTitle("Unsplash API")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
