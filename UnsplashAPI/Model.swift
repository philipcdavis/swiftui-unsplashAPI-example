//
//  Model.swift
//  LazyHTTP
//
//  Created by Philip Davis on 1/25/21.
//

import Foundation

struct Photo: Identifiable, Decodable {
    var id: String
    var urls: [String: String]
}

class UnsplashData: ObservableObject {
    @Published var photoArray: [Photo] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        // Add your Key Here
        let key = "YOUR_KEY_HERE"
        let url = "https://api.unsplash.com/photos/random/?count=7&client_id=\(key)"
    
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data else {
                print("URLSession DataTask Error:", error ?? "nil" )
                return
            }
            do {
                let json = try JSONDecoder().decode([Photo].self, from: data)
//                print(json)
                for photo in json {
                    DispatchQueue.main.async {
                        self.photoArray.append(photo)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
