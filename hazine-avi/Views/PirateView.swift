//
//  PirateView.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import SwiftUI

struct PirateView: View {
    let pirate: Pirate
        @State private var isHighlighted = false
        
        var body: some View {
            VStack {
                Image(pirate.image)
                    .resizable()
                    .frame(width: 80, height: 100)
                
                Text(pirate.name)
                    .font(.caption)
                
                TreasureBagView(treasures: pirate.treasures)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isHighlighted ? Color.yellow : Color.clear, lineWidth: 2)
            )
            .onDrop(of: ["treasure"], delegate: PirateDropDelegate(pirate: pirate, isHighlighted: $isHighlighted))
        }
}

#Preview {
    PirateView()
}
