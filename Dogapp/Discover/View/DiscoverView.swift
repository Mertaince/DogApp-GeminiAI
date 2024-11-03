//
//  DiscoverView.swift
//  Dogapp
//
//  Created by Mert ATK on 1.11.2024.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject private var viewModel = DiscoverViewModel()
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        let screenWidth = screenSize.width
        
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.filteredPlants) { plant in
                        PlantCard(plant: plant)
                            .frame(maxWidth: screenWidth * 0.9)
                            .frame(height: 250) 
                    }
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle("Bitkiler")
            .background(Color.white)
        }
        .searchable(text: $viewModel.searchText, prompt: "Bitki ara")
    }
}

struct PlantCard: View {
    var plant: Plant
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
               Image(plant.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .cornerRadius(8)
                .frame(maxWidth: .infinity)
             }
             .padding(.bottom, 8)
            Text(plant.name)
                .font(.headline)
                .padding(.top, 8)

            Text(plant.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 2)
            
            Rectangle()
                .fill(plant.difficulty.color)
                .frame(height: 10)
                .cornerRadius(5)
                .padding(.top, 8)
            
            Text("Besleme Zorluğu: \(plant.difficulty.rawValue)")
                .font(.caption)
                .foregroundColor(.gray)
                
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}


