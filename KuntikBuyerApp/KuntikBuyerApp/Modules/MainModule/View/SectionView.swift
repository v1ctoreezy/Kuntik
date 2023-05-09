//
//  SectionView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 24.04.2023.
//

import SwiftUI

//struct SectionView: View {
//    var section: String
//    var products: [ItemModel]
//    @StateObject var cartManager = CartManager()
//    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
//
//    var body: some View {
//        VStack {
//            Text("v")
//                .frame(width: Constants.screenWidth - 38, alignment: .leading)
//            LazyVGrid(columns: columns, spacing: 20) {
//                ForEach(products, id: \.id) { product in
//                    if product.category.rawValue == section.lowercased() {
//                        ProductCard(product: product)
//                            .environmentObject(cartManager)
//                    }
//                }
//            }
//            .padding()
//        }
//    }
//}

//struct SectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionView()
//    }
//}
