//
//  ImageLoader.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 23.04.2023.
//

import Foundation
import UIKit

final class ImageLoader: ObservableObject {
    var url: String?
    @Published var image: UIImage? = nil
    @Published var isLoading = false
    
    init(url: String?) {
        self.url = url
    }
    
    func getImage() {
        guard image == nil && !isLoading else { return }
        guard let url = url, let fetchUrl = URL(string: url) else { return }

        DispatchQueue.main.async {
            self.isLoading = true
        }
        let request = URLRequest(url: fetchUrl, cachePolicy: .returnCacheDataDontLoad)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    do {
                        self.image = image
                        print(data)
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
