//
//  DiscoverViewModel.swift
//  Dogapp
//
//  Created by Mert ATK on 1.11.2024.
//

import SwiftUI
import Combine

class DiscoverViewModel: ObservableObject {
    @Published var searchText: String = ""
    
    private var allPlants: [Plant] = [
        Plant(name: "Aloe Vera", description: "Aloe vera, sıcak ve kuru iklimlerde doğal olarak yetişen bir sukulent bitkisidir. Yaprakları etli ve jöle kıvamında bir madde içerir", imageName: "aloevera", difficulty: .easy),
        Plant(name: "Gül", description: "Gül, Rosaceae familyasına ait, güzel ve kokulu çiçekleriyle bilinen bir bitki cinsidir. Dünya genelinde pek çok türü ve çeşidi bulunan güller, estetik ve sembolik anlamda önemli bir yere sahiptir.", imageName: "gul", difficulty: .medium),
        Plant(name: "Kaktüs", description: "Kaktüs, Cactaceae familyasına ait, genellikle sıcak ve kuru iklimlerde yetişen sukulent bitkileridir. Kaktüslerin birçok farklı türü ve formu bulunur.", imageName: "kaktus", difficulty: .hard),
        Plant(name: "Papatya", description: "Papatya, Asteraceae familyasına ait, genellikle beyaz yaprakları ve sarı ortasıyla tanınan şirin bir çiçek türüdür. Papatyalar, hem estetik hem de sağlık faydaları ile bilinir.", imageName: "papatya", difficulty: .easy)
    ]
    
    var filteredPlants: [Plant] {
        if searchText.isEmpty {
            return allPlants
        } else {
            return allPlants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}


