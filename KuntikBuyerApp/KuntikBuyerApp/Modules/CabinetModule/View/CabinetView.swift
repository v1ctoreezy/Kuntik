//
//  CabinetView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import SwiftUI

struct CabinetView: View {
    @ObservedObject var viewModel = CabinetViewModel()
    
    var columns = [GridItem(.adaptive(minimum: 180), spacing: 10)]
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color(UIColor.systemGray5)
                        .cornerRadius(20)
                        .frame(height: 100)
                    HStack {
                        Image("sweater4")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .cornerRadius(65)
                            .scaledToFill()
                        VStack(alignment: .leading) {
                            Text("Ольга")
                                .font(.title2)
                                .fontWeight(.bold)
                            Button("Настройки аккаунта") {
                                
                            }.foregroundColor(.black)
                        }
                        Spacer()
                    }.frame(width: Constants.screenWidth - 20)
                }
                
                isSellingNow
                
                NavigationLink("Разметить товар...") {
                    PlaceOrder(orderViewModel: viewModel)
                }
                
                Spacer()
                
                Text("Не нашли что искали?")
                Button("Напишите нам") {
                    
                }
            }
        }
    }
    
    var isSellingNow: some View {
        ZStack {
            Color(UIColor.systemGray5)
                .cornerRadius(20)
            VStack {
                VStack {
                    HStack(alignment: .center) {
                        Text("Сейчас продаются")
                            .font(.title3)
                            .bold()
                    }
                    .frame(width: Constants.screenWidth - 20)
                        .offset(y: 20)
                    Spacer()
                }
                if viewModel.placedViewModel.count == 0 {
                    VStack(alignment: .center) {
                        Text("Вы пока что не разместили товар :(")
                        Spacer()
                    }
                } else {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: columns) {
                                ForEach(viewModel.placedViewModel, id: \.id) { product in
                                    PlacedProduct(product: product)
                                }
                            }
                        }.frame(height: 300)
                    }
                }
            }
        }
        .frame(height: 350)
    }
}

struct CabinetView_Previews: PreviewProvider {
    static var previews: some View {
        CabinetView()
    }
}
