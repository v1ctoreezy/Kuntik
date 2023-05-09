//
//  ProductCard.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 23.04.2023.
//

import Foundation
import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    @State var show: Bool = false
    var product: ItemModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                NavigationLink {
                    DetailView(item: product)
                } label: {
                    ImageLoadingView(url: product.image)
                        .frame(width: 180)
                }
                
                VStack(alignment: .leading) {
                    Text(product.title)
                        .bold()
                    
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: testProduct)
            .environmentObject(CartManager())
    }
}
