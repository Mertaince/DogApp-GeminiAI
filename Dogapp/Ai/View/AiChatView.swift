//
//  AiChatView.swift
//  Dogapp
//
//  Created by Mert ATK on 28.10.2024.
//

import SwiftUI
import GoogleGenerativeAI

struct AiChatView: View {
    @StateObject private var viewModel = AiChatViewModel()
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button(action: viewModel.refreshMessages) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(.systemGreen))
                        Image(systemName: "gobackward")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                    }
                }.padding(.horizontal,12)
            }
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.messages, id: \.0) { message, isUserMessage in
                        MessageBubble(message: message, isUserMessage: isUserMessage)
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("Yeni mesaj...", text: $viewModel.newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: viewModel.sendMessage) {
                    Text("Gönder")
                        .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
           
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                   
                }) {
                    Image(systemName: "trash.fill")
                }
            }
        }
    }
}

struct MessageBubble: View {
    let message: String
    let isUserMessage: Bool
    
    var body: some View {
        HStack {
            if isUserMessage {
                Spacer() // Kullanıcı mesajı sağa yasla
                Text(message)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .frame(maxWidth: 300, alignment: .trailing)
            } else {
                HStack{
                    Image(systemName: "leaf.fill")
                        .foregroundColor(Color(.systemGreen))
                    Text(message)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(25)
                        .frame(maxWidth: 300, alignment: .leading)
                }
                Spacer() // AI yanıtı sola yasla
            }
        }
    }
}



struct AiChatView_Previews: PreviewProvider {
    static var previews: some View {
        AiChatView()
    }
}
