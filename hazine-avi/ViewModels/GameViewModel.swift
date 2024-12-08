//
//  GameViewModel.swift
//  hazine-avi
//
//  Created by Ejder Dağ on 8.12.2024.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var chestTreasures: [Treasure] = []
    @Published var captainPirate: Pirate
    @Published var crewPirates: [Pirate] = []
    @Published var gameState: GameState = .waiting
    
    init() {
        // Başlangıç değerlerini ayarla
        captainPirate = Pirate(name: "Korsan Tekgöz", image: "captain")
        crewPirates = [
            Pirate(name: "Çevik Jack", image: "pirate1"),
            Pirate(name: "Korsan Mary", image: "pirate2"),
            Pirate(name: "Uzun John", image: "pirate3")
        ]
        setupInitialTreasures()
    }
    
    private func setupInitialTreasures() {
        // Hazine sandığını doldur
        chestTreasures = [
            Treasure(type: .yakut, value: 50),
            Treasure(type: .inci, value: 240),
            Treasure(type: .altinPara, value: 450)
        ]
    }
    
    func checkDistribution() -> Bool {
        // Dağıtım kontrolü
        // Doğru dağıtım yapıldıysa true döndür
        return true
    }
}
