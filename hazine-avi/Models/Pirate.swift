//
//  Pirate.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import Foundation

struct Pirate: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    var treasures: [Treasure] = []
    var expectedShare: [Treasure] = []
}
