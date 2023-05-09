//
//  NetworkManager.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import Foundation
import SwiftUI

struct NetworkManager {
    func getData<Type: Codable> (url: String, completion: @escaping ([Type]) -> ()){
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let response = try decoder.decode([Type].self, from: data!)
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
//    func loadImage(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
////                if let image = UIImage(data: data) {
////                }
//                Image(data)
//            }
//        }
//    }
}
