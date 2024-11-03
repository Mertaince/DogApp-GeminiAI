//
//  Modifier.swift
//  Dogapp
//
//  Created by Mert ATK on 3.11.2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier{
    func body(content: Content) ->some View{
        content
            .font(.subheadline)
            .padding(18)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,22)
            .foregroundColor(.black)
    }
}

struct ButtonBorderGreen: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 350, height: 60)
            .background(.white)
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.green, lineWidth: 2))
            .foregroundColor(Color(.systemGreen))
    }
}
