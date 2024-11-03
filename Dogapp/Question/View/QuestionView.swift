//
//  QuestionView.swift
//  Dogapp
//
//  Created by Mert ATK on 2.11.2024.
//

import SwiftUI

struct QuestionView: View {
    @StateObject private var viewModel = QuestionViewModel()
    @State private var isAddingQuestion = false
    @State private var newQuestionContent = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.questions) { question in
                    Text(question.content)
                        .padding()
                }.onDelete(perform: viewModel.removeQuestion)
            }
            .navigationTitle("Sorular")
            .navigationBarItems(trailing: Button(action: {
                isAddingQuestion.toggle()
            }) {
                Image(systemName: "plus")
                    .font(.title)
            })
            .sheet(isPresented: $isAddingQuestion) {
                ZStack {
                    Color(UIColor.systemGroupedBackground)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Text("Yeni Soru Sor")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top, 20)
                            .foregroundColor(.primary)

                        TextField("Soru yazın...", text: $newQuestionContent)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)

                        Button(action: {
                            viewModel.addQuestion(newQuestionContent)
                            newQuestionContent = ""
                            isAddingQuestion = false
                        }) {
                            Text("Ekle")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(newQuestionContent.isEmpty ? Color.gray : Color.blue)
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .disabled(newQuestionContent.isEmpty)

                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
