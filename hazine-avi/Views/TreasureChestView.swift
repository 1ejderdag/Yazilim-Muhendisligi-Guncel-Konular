//
//  TreasureChestView.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import SwiftUI

struct TreasureChestView: View {
    @Binding var treasures: [Treasure]
       
       var body: some View {
           ZStack {
               // Sandık görseli
               Image("treasure_chest")
                   .resizable()
                   .frame(width: 200, height: 150)
               
               // Hazineler
               ForEach(treasures) { treasure in
                   DraggableTreasureView(treasure: treasure)
                       .position(randomPosition())
               }
           }
       }
       
       private func randomPosition() -> CGPoint {
           // Sandık içinde rastgele pozisyon
           CGPoint(
               x: CGFloat.random(in: 50...150),
               y: CGFloat.random(in: 50...100)
           )
       }
}

//#Preview {
//    TreasureChestView()
//}
