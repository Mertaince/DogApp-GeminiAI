//
//  ChatServices.swift
//  Dogapp
//
//  Created by Mert ATK on 28.10.2024.
//

import GoogleGenerativeAI
import SwiftUI

class AiChatViewModel: ObservableObject {
    @Published var messages: [(String, Bool)] = []
    @Published var newMessage: String = ""
    private let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: APIKey.value)
    
    func sendMessage() {
        if !newMessage.isEmpty {
            messages.append((newMessage, true))
            aiSendMessage(for: newMessage)
            newMessage = "" // TextField temizleme
        }
    }
    
    private func aiSendMessage(for userMessage: String) {
        Task {
            do{
                let responce = try await
                model.generateContent(userMessage)
                guard let text = responce.text else {
                    messages.append(("Üzgünüm tekrar deneyiniz", false))
                    return
                }
                messages.append((text, false))
                
            } catch {
                messages.append(("Bir şeyler ters gitti: \(error.localizedDescription)", false))
            }
        }
    }
    
    func refreshMessages() {
        newMessage = ""
        messages = [("Mesajlar yenilendi", false)]
    }
}
