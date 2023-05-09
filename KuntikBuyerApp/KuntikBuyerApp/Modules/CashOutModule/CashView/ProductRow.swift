//
//  ProductRow.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 23.04.2023.
//

import Foundation
import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: ItemModel
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(width: 50)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title)
                    .bold()

                Text("$\(product.price)")
            }
            
            Spacer()

            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//struct ProductRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductRow(product: productList[2])
//            .environmentObject(CartManager())
//    }
//}
