//
//  CabinetModel.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 27.04.2023.
//

import Foundation

struct CabinetModel: Codable, Identifiable {
    let id = UUID()
    let title: String
    let price: Int
    let description: String
    let category: Category
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case title, price, description, image, category
    }
}
