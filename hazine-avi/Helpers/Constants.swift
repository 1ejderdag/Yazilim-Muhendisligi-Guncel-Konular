//
//  Constants.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import Foundation

enum Constants {
    static let treasureDistributionRules = [
        TreasureType.yakut: (captainShare: 5, crewShare: 1),
        TreasureType.inci: (captainShare: 12, crewShare: 4),
        TreasureType.altinPara: (captainShare: 90, crewShare: 10)
    ]
    
    static let dragSensitivity: CGFloat = 50.0
    static let animationDuration: Double = 0.3
}
