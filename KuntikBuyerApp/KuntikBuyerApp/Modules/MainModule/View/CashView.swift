//
//  CashView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 23.04.2023.
//

import Foundation
import SwiftUI

struct CashView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView() {
            if cartManager.paymentSuccess {
                Text("Благодарим за покупку! Чек будет отправлен на вашу почту AppleID.")
                    .padding()
            } else {
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("Всего: ")
                        Spacer()
                        Text("$\(cartManager.total).00")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: cartManager.pay)
                        .padding()
                    
                } else {
                    Text("Корзина пуста.")
                        .bold()
                }
            }
        }
        .navigationTitle(Text("Мои заказы"))
        .padding(.top)
        .onDisappear {
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}
