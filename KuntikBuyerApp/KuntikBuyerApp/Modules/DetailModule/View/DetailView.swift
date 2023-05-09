//
//  DetailView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 09.04.2023.
//

import SwiftUI
import Stripes

struct DetailView: View {
    var item: ItemModel
    @StateObject var cartManager = CartManager()
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: item.image)) { image in
                    image
                        .resizable()
                        .clipped()
                        .frame(width: Constants.screenWidth, height: Constants.screenWidth)
//                        .scaledToFit()
    //                    .cornerRadius(30)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.largeTitle)
                        Text("$" + String(item.price))
                            .fontWeight(.heavy)
                    }
                    HStack {
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                        Circle().fill(Color.blue).frame(width: 20, height: 20)
                        Circle().fill(Color.black).frame(width: 20, height: 20)
                    }
                }
                Text(item.description)
                Spacer()
            }
        }.navigationBarItems(trailing: Text("Купить"))
        //            .frame(width: 400, height: 400)
        //                .background(.white)
        //                .cornerRadius(20)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: testProduct)
        
    }
}
