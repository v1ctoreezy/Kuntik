//
//  ListViewModel.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import Foundation

enum API {
    static let api: String = "https://fakestoreapi.com/products"
}

final class ListViewModel: ObservableObject {
    
    @Published var listViewModel: [ItemModel] = []
    private var manager = NetworkManager()
    
    init() {
        readFile()
    }
    
    private func getItems() {
        manager.getData(url: API.api) { items in
            self.listViewModel = items
        }
    }
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "cloth", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                let jsonData = try decoder.decode(Items.self, from: data)
                listViewModel = jsonData.items
            } catch {
                print(error)
            }
        }
    }
}
