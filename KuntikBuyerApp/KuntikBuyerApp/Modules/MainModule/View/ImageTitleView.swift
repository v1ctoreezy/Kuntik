//
//  WelcomeHomeView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 24.04.2023.
//

import SwiftUI

struct ImageTitleView: View {
    var title: String
    var body: some View {
        HStack {
            Image("sweater4")
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(25)
                .scaledToFill()
            Text(title)
        }
    }
}

struct WelcomeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTitleView(title: "Рады вас видеть!")
    }
}
