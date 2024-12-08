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
    @Published var dragPosition: CGPoint?
    @Published var feedback: String?
    
    init() {
        // Başlangıç değerleri
        captainPirate = Pirate(name: "Korsan Tekgöz", image: "captain")
        crewPirates = [
            Pirate(name: "Çevik Jack", image: "pirate1"),
            Pirate(name: "Korsan Mary", image: "pirate2"),
            Pirate(name: "Uzun John", image: "pirate3")
        ]
        setupInitialTreasures()
    }
    
    private func setupInitialTreasures() {
        // Hazine sandığını başlangıç
        chestTreasures = [
            Treasure(type: .yakut, value: 50),
            Treasure(type: .inci, value: 240),
            Treasure(type: .altinPara, value: 450)
        ]
    }
    
    func checkDistribution() -> Bool {
        return true
    }
    // 2. bölüm
    func updateDragPosition(_ position: CGPoint) {
        dragPosition = position
    }
    
    func findTargetPirate(at position: CGPoint) -> Pirate? {
        
        return nil
    }
    
    func distributeTreasure(_ treasure: Treasure, to pirate: Pirate) {
        guard let index = crewPirates.firstIndex(where: { $0.id == pirate.id }) else { return }
        
        
        let rules = Constants.treasureDistributionRules[treasure.type]!
        
        if pirate.name == "Korsan Tekgöz" {
            if treasure.value % rules.captainShare == 0 {
                crewPirates[index].treasures.append(treasure)
                playSuccessSound()
            } else {
                showError("Bu hazine Tekgöz'e ait değil!")
            }
        } else {
            if treasure.value % rules.crewShare == 0 {
                crewPirates[index].treasures.append(treasure)
                playSuccessSound()
            } else {
                showError("Bu hazine mürettebata ait değil!")
            }
        }
        
        checkGameCompletion()
    }
    
    private func playSuccessSound() {
        // Ses efekti çalma
    }
    
    private func showError(_ message: String) {
        feedback = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.feedback = nil
        }
    }
    
    private func checkGameCompletion() {
        if chestTreasures.isEmpty {
            if validateDistribution() {
                gameState = .completed
                feedback = "Harika! Hazineyi doğru şekilde paylaştın!"
            } else {
                gameState = .failed
                feedback = "Tekrar dene! Paylaşım doğru değil."
            }
        }
    }
    
    private func validateDistribution() -> Bool {
        return true
    }
}
