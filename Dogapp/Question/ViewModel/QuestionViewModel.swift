//
//  QuestionViewModel.swift
//  Dogapp
//
//  Created by Mert ATK on 2.11.2024.
//

import SwiftUI
import Combine

class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = [
        Question(content: "Aloe vera nasıl bakılır?"),
        Question(content: "Güller ne kadar su ister?"),
        Question(content: "Kaktüslerin ihtiyacı olan su miktarı ne kadardır?"),
        Question(content: "Papatyalar hangi toprakta yetişir?")
    ]
    
    func addQuestion(_ content: String) {
        let newQuestion = Question(content: content)
        questions.append(newQuestion)
    }
    
    func removeQuestion(at index: IndexSet) {
        questions.remove(atOffsets: index)
    }
}
