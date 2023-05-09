//
//  MainView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import SwiftUI
import Stripes

struct MainView: View {
    @StateObject private var viewModel = ListViewModel()
    @StateObject var cartManager = CartManager()
    @State var shouldGo: Bool = false
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.listViewModel, id: \.id) { product in
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Text("Товары дня"))
            .navigationBarItems(leading: ImageTitleView(title: "Рады вас видеть!"), trailing: NavigationLink {
                CashView()
                    .environmentObject(cartManager)
            } label: {
                CartButton(numberOfProducts: cartManager.products.count)
            })
        }
        .onAppear {
            URLCache.shared.memoryCapacity = 1024 * 1024 * 512
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
