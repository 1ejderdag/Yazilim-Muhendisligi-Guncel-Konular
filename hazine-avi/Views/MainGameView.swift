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
        }
}

#Preview {
    MainGameView()
}
