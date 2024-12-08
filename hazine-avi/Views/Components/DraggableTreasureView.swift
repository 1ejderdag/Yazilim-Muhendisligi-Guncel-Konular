//
//  DraggableTreasureView.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import SwiftUI

struct DraggableTreasureView: View {
    @EnvironmentObject var viewModel: GameViewModel
    let treasure: Treasure
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        Image(treasure.type.imageName)
            .resizable()
            .frame(width: 50, height: 50)
            .offset(offset)
            .scaleEffect(isDragging ? 1.2 : 1.0)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        isDragging = true
                        offset = gesture.translation
                        viewModel.updateDragPosition(gesture.location)
                    }
                    .onEnded { gesture in
                        withAnimation(.spring()) {
                            if let targetPirate = viewModel.findTargetPirate(at: gesture.location) {
                                viewModel.distributeTreasure(treasure, to: targetPirate)
                            }
                            offset = .zero
                            isDragging = false
                        }
                    }
            )
    }
}

//#Preview {
//    DraggableTreasureView()
//}
