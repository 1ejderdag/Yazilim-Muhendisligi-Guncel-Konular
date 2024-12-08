//
//  MainGameView.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import SwiftUI

struct MainGameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                // Hazine Sandığı
                TreasureChestView(treasures: $viewModel.chestTreasures)
                
                Spacer()
                
                // Korsan Tekgöz
                PirateView(pirate: viewModel.captainPirate)
                
                HStack {
                    // Diğer Korsanlar
                    ForEach(viewModel.crewPirates) { pirate in
                        PirateView(pirate: pirate)
                    }
                }
            }
            .padding()
            
            if let feedback = viewModel.feedback {
                Text(feedback)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .transition(.scale)
                    .animation(.easeInOut)
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    MainGameView()
}
