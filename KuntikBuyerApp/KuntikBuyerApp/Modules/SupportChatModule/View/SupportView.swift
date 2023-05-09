//
//  SupportView.swift
//  KuntikBuyerApp
//
//  Created by Виктор Черкасов on 08.04.2023.
//

import SwiftUI
import Stripes

struct SupportView: View {
    @State var messageText: String = ""
    @StateObject var viewModel = CompleteMessagaeViewModel()
    var orderMessage: String?
    
    init(orderMessage: String? = nil) {
        self.orderMessage = orderMessage
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("Чат")
                    .font(.largeTitle)
                    .bold()
                HStack {
                    Text("Марина")
                        .frame(width: Constants.screenWidth - 38, alignment: .leading)
                }
                .frame(width: Constants.screenWidth, height: 40)
                .border(.gray, width: 0.5)
                
            }
            ZStack {
                Color(UIColor.systemGray5)
                ScrollView {
                    ForEach(viewModel.messages, id: \.self) { message in
                        if message.contains("[USER]") {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            HStack {
                                Spacer()
                                Text(newMessage)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.blue.opacity(1))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                            }
                        } else {
                            HStack {
                                Text(message)
                                    .padding()
                                    .background(.white.opacity(1))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                                Spacer()
                            }
                        }
                        
                    }.rotationEffect(.degrees(180))
                }
                .rotationEffect(.degrees(180))
                .edgesIgnoringSafeArea(.top)
            }
            HStack {
                TextField("Начните писать...", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding()
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            guard let orderMessage = orderMessage else { return }
            messageText = orderMessage
        }
    }
    
    private func sendMessage(message: String) {
        withAnimation {
            viewModel.messages.append("[USER]" + message)
            self.messageText = ""
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    viewModel.messages.append(viewModel.getBotResponse(message: message))
                }
            }
        }
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
