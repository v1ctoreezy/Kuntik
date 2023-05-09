//
//  SpecialPickerSection.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 26.04.2023.
//

import SwiftUI

struct SpecialPickerSection: View {
    var title: String
    @Binding var data: Int
    @StateObject var viewModel: SpecialItemViewModel
    
    var body: some View {
        Section(title) { 
            Picker(selection: $data,
                   label: Text("Выберите цвет")) {
                ForEach(0..<viewModel.colors.count) { index in
                    Text(self.viewModel.colors[index].name)
                }
            }
        }
    }
}

struct SpecialPickerSection_Previews: PreviewProvider {
    static var previews: some View {
        SpecialView()
    }
}
