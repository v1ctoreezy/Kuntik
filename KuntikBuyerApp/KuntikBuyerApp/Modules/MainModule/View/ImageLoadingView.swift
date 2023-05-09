//
//  ImageLoadingView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 23.04.2023.
//

import SwiftUI

struct ImageLoadingView: View {
    @StateObject var imageLoader: ImageLoader
    
    init(url: String?) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .cornerRadius(30)
                    .frame(width: 180)
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
                    .frame(width: 180)
            }
        }.onAppear {
            DispatchQueue.global(qos: .background).async {
                imageLoader.getImage()
            }
        }
    }
}

struct ImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadingView(url: testProduct.image)
    }
}
