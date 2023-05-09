//
//  ContentView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var mainModule = MainView()
    var specialModule = SpecialView()
    var supportModule = SupportView()
    var cabinetModule = CabinetView()
    var body: some View {
        TabView {
            mainModule.tabItem {
                Image(systemName: "cart.fill")
                Text("Buy")
            }
            specialModule.tabItem {
                Image(systemName: "gear")
                Text("Special!")
            }
            
            cabinetModule.tabItem {
                Image(systemName: "person")
                Text("Cabinet")
            }
            
            supportModule.tabItem {
                Image(systemName: "questionmark.circle")
                Text("Help")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
