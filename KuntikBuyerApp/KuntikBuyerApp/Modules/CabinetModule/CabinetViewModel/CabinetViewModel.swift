//
//  CabinetViewModel.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 27.04.2023.
//

import Foundation

final class CabinetViewModel: ObservableObject {
    @Published var placedViewModel: [CabinetModel] = []
    
    func addItem(item: CabinetModel) {
        placedViewModel.append(item)
    }
}
