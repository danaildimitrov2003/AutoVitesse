//
//  ImageFetcherExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 25.07.23.
//

import Foundation
import Combine
import UIKit

extension ImageFetcher {
    func setUpSubriber() {
        fetchImagePublisher
            .compactMap { URL(string: $0) }
            .sink { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { url in
                self.savedImageURLs.append(url)
            }
            .store(in: &subscriptions)
    }
    func fetchUnsplashPhotos(for search: String) {
        let modifiedSearch = search.replacingOccurrences(of: " ", with: "_")
        let urlString =
        "https://api.unsplash.com/photos/random?query=\(modifiedSearch)&count=2&client_id=\(env.unsplashAccessKey)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL.")
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                guard let safeJson = json else {return}
                for i in safeJson.indices {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                        if let urls = safeJson[i]["urls"] as? [String: String], let regularURL = urls["regular"] {
                            print("\(i)")
                            self.fetchImagePublisher.send(regularURL)
                        }
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }.resume()
    }
}
