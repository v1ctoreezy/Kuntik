//
//  MessageTemplate.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 09.04.2023.
//

import Foundation

struct Message {
    var size: Double
    var color: String
    var additionalInfo: String
    
    func message() -> String {
        "Добрый день! Хочу заказать кунтик с параметрами: /n \(size) размер, \(color) цвет. /n Дополнительные параметры: \(additionalInfo)"
    }
}
