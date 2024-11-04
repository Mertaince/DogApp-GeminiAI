//
//  TabBarView.swift
//  Dogapp
//
//  Created by Mert ATK on 3.11.2024.
//

import SwiftUI

struct TabBarView: View{
    @State private var selectionIndex = 0
    var body: some View {
        TabView(selection: $selectionIndex) {
            DiscoverView()
                .onAppear(){
                    selectionIndex = 0
                }.tabItem {
                    Image(systemName: "house")
                }
            QuestionView()
                .onAppear(){
                    selectionIndex = 1
                }.tabItem {
                    Image(systemName: "magnifyingglass")
                }
            AiChatView()
                .onAppear(){
                    selectionIndex = 2
                }.tabItem {
                    Image(systemName: "leaf.fill")
                }
        }
    }
}
