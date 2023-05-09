//
//  SupportViewModel.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 09.04.2023.
//

import Foundation

final class CompleteMessagaeViewModel: ObservableObject {
    @Published var messages: [String] = ["Добрый день! Какой у вас вопрос?"]
    @Published var order: OrderModel = OrderModel()
    
    func getBotResponse(message: String) -> String {
        let tempMessage = message.lowercased()
        if tempMessage.contains("хочу заказать") {
            return "Да, конечно."
        } else if tempMessage.contains("досвидания") {
            return "Спасибо за заказ! Всего доброго."
        } else if tempMessage.contains("+7") {
            return "Заказ принят."
        } else if tempMessage.contains("добрый день") {
            return "Здравствуйте!"
        } else {
            return "Повторите, пожалуйста,"
        }
    }
    
    func sendMessage(message: String) {
        messages.append(message)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.messages.append(self.getBotResponse(message: message))
        }
    }
}
