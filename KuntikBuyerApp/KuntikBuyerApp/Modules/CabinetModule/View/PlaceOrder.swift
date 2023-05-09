//
//  PlaceOrder.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 30.04.2023.
//

import SwiftUI

struct PlaceOrder: View {
    @State var mainSelectedColor = 0
    @State var soleSelectedColor = 0
    @State var lacesSelectedColor = 0
    @State var insolesSelectedColor = 0
    @State var title = ""
    @State var size = ""
    @State var price = ""
    
    @StateObject private var viewModel = SpecialItemViewModel()
    @StateObject var orderViewModel: CabinetViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    SpectialTextSection(title: "Название", data: $title)
                    SpectialTextSection(title: "Размер обуви", data: $size)
                    SpecialPickerSection(title: "Основной цвет", data: $mainSelectedColor, viewModel: viewModel)
                    SpecialPickerSection(title: "Цвет подошвы", data: $soleSelectedColor, viewModel: viewModel)
                    SpecialPickerSection(title: "Цвет шнурков", data: $lacesSelectedColor, viewModel: viewModel)
                    SpecialPickerSection(title: "Цвет стелек", data: $insolesSelectedColor, viewModel: viewModel)
                    SpectialTextSection(title: "Стоимость", data: $price)
                }
                .listStyle(.inset)
                Button("Разместить", action: {
                    orderViewModel.addItem(item: CabinetModel(title: title, price: Int(price) ?? 0, description: "", category: .sneakers, image: "https://images.asos-media.com/products/adidas-originals-adicolour-three-stripe-t-shirt-in-sky-blue/201764441-1-blue?$n_640w$&wid=513&fit=constrain"))
                })
                .foregroundColor(.black)
                .padding(.all, 20)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
                Spacer()
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle(Text("Разместите заказ"))
        }
    }
}

//struct PlaceOrder_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceOrder()
//    }
//}
