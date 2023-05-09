//
//  PrevBrought.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 27.04.2023.
//

import SwiftUI

struct PlacedProduct: View {
    var product: CabinetModel
     
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                NavigationLink {
//                    DetailView(item: product)
                } label: {
                    ImageLoadingView(url: product.image)
                        .frame(width: 180)
//                    AsyncImage(url: URL(string: product.image)) { image in
//                        image
//                            .resizable()
//                            .cornerRadius(30)
//                            .frame(width: 180)
//                            .aspectRatio(contentMode: .fit)
//                    } placeholder: {
//                        ProgressView()
//                    }
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
            
//            Button {
//                cartManager.addToCart(product: product)
//            } label: {
//                Image(systemName: "plus")
//                    .padding(10)
//                    .foregroundColor(.white)
//                    .background(.black)
//                    .cornerRadius(50)
//                    .padding()
//            }
        }
    }
}

struct PlacedProduct_Previews: PreviewProvider {
    static var previews: some View {
        PlacedProduct(product: testProductCabinet)
            .environmentObject(CartManager())
    }
}
