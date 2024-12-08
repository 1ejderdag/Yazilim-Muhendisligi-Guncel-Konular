//
//  DraggableTreasureView.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import SwiftUI

struct DraggableTreasureView: View {
    let treasure: Treasure
        @State private var offset = CGSize.zero
        @State private var isDragging = false
        
        var body: some View {
            Image(treasure.type.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            isDragging = true
                            offset = gesture.translation
                        }
                        .onEnded { gesture in
                            // Hedef kontrolü ve bırakma mantığı
                        }
                )
        }
}

#Preview {
    DraggableTreasureView()
}
