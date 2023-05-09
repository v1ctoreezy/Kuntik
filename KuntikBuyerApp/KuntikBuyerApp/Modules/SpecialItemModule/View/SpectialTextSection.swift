//
//  SpectialSection.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 26.04.2023.
//

import SwiftUI

struct SpectialTextSection: View {
    var title: String
//    var place
    @Binding var data: String
    
    var body: some View {
        Section(title) {
            TextField("", text: $data)
        }
    }
}
