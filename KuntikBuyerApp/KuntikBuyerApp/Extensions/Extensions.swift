//
//  Extensions.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 27.04.2023.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
