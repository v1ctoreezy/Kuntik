//
//  ItemModel.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import Foundation

struct ItemModel: Codable, Identifiable {
    let id = UUID()
    let title: String
    let price: Int
    let description: String
    let category: Category
    let image: String
//    let rating: Rating
    
    enum CodingKeys: String, CodingKey {
        case title, price, description, image, category
    }
}

struct Items: Codable {
    let items: [ItemModel]
}

enum Category: String, Codable {
    case sweater = "sweaters"
    case sneakers = "sneakers"
    case tShirts = "t-shirts"
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

//typealias Kuntik = [KuntikModel]
