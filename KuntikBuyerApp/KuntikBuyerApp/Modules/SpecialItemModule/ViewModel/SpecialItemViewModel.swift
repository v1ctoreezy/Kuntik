//
//  SpecialItemViewModel.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import Foundation

final class SpecialItemViewModel: ObservableObject {
    @Published var colors: [Colour] = []
    var order = OrderModel()
    
    init() {
        readFile()
    }
    
    func prepareMessage() -> String {
//        let view = SupportView()
//        view.messageText = Message(size: order.size, color: order.color, additionalInfo: order.additionalInfo).message()
//        var tmp = Message(size: order.size, color: order.color, additionalInfo: order.additionalInfo).message()
        return Message(size: order.size, color: order.color, additionalInfo: order.additionalInfo).message()
    }
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "colors", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(Colors.self, from: data) {
                self.colors = jsonData.colors
            }
        }
    }
}
