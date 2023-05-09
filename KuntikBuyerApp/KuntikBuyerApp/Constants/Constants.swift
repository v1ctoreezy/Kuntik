//
//  Constants.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import Foundation
import SwiftUI

enum Constants {
    static let horizontal: CGFloat = 120
    static let vertical: CGFloat = 120
    static let spacing: CGFloat = 10
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
}

var testProduct = ItemModel(title: "Women's Adidas 3-Stripes T-Shirt", price: 150, description: "The Adidas 3-Stripes T-Shirt features a classic design and comfortable fit.", category: .tShirts, image: "https://images.asos-media.com/products/adidas-originals-adicolour-three-stripe-t-shirt-in-sky-blue/201764441-1-blue?$n_640w$&wid=513&fit=constrain")

var testProductCabinet = CabinetModel(title: "Women's Adidas 3-Stripes T-Shirt", price: 150, description: "The Adidas 3-Stripes T-Shirt features a classic design and comfortable fit.", category: .tShirts, image: "https://images.asos-media.com/products/adidas-originals-adicolour-three-stripe-t-shirt-in-sky-blue/201764441-1-blue?$n_640w$&wid=513&fit=constrain")
