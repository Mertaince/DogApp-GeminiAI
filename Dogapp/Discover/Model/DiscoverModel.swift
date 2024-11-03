//
//  DiscoverViewModel.swift
//  Dogapp
//
//  Created by Mert ATK on 1.11.2024.
//

import SwiftUI

struct Plant: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var difficulty: Difficulty
}

enum Difficulty: String {
    case easy = "Kolay"
    case medium = "Orta"
    case hard = "Zor"
    
    var color: Color {
        switch self {
        case .easy:
            return Color.green
        case .medium:
            return Color.yellow
        case .hard:
            return Color.red
        }
    }
}
