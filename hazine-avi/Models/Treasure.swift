//
//  Treasure.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import Foundation

enum TreasureType {
    case yakut
    case inci
    case altinPara
}

struct Treasure: Identifiable {
    let id = UUID()
    let type: TreasureType
    let value: Int
}
