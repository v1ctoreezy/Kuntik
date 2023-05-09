//
//  SupportModel.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 09.04.2023.
//

import Foundation

struct ClientMessagaes {
    var message: String
}

struct SupportResponse {
    var message: String
}

struct OrderModel {
    var size: Double
    var color: String
    var additionalInfo: String
    
    init() {
        self.size = 0.0
        self.color = ""
        self.additionalInfo = ""
    }
}
