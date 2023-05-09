//
//  SpecialView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import SwiftUI

struct SpecialView: View {
    @State var mainSelectedColor = 0
    @State var soleSelectedColor = 0
    @State var lacesSelectedColor = 0
    @State var insolesSelectedColor = 0
    @State var size = ""
    @State var additionalInfo = ""
    @StateObject var viewModel = SpecialItemViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    SpectialTextSection(title: "Размер обуви", data: $size)
                    SpecialPickerSection(title: "Основной цвет", data: $mainSelectedColor, viewModel: viewModel)
                    SpecialPickerSection(title: "Цвет подошвы", data: $soleSelectedColor, viewModel: viewModel)
                    SpecialPickerSection(title: "Цвет шнурков", data: $lacesSelectedColor, viewModel: viewModel)
                    SpecialPickerSection(title: "Цвет стелек", data: $insolesSelectedColor, viewModel: viewModel)
                    SpectialTextSection(title: "Что-то еще?", data: $additionalInfo)
                }
                .listStyle(.inset)
                NavigationLink(destination: {
                    SupportView(orderMessage: Message(size: Double(size) ?? 0.0, color: viewModel.colors[mainSelectedColor].name, additionalInfo: additionalInfo).message())
                }, label: {
                    Text("Заказать")
                })
                .foregroundColor(.black)
                .padding(.all, 20)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
                Spacer()
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle(Text("Собственный дизайн"))
        }
    }
}

struct SpecialView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialView()
    }
}
