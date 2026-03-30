//
//  MisionVm.swift
//  testhorno
//
//  Created by Magda on 14/03/26.
//

import Foundation
import SwiftUI
import Combine

final class MissionViewModel: ObservableObject {
    
    @Published var missions: [Mission] = [
        Mission(
            title: "Busca el carro antiguo",
            location: "Galeria de historia",
            expectedLabel: "Camioneta",
            acceptedLabels: ["Camioneta"],
            isCompleted: false
        ),
        Mission(
            title: "Busca al remachero",
            location: "Galeria de historia",
            expectedLabel: "El remachero",
            acceptedLabels: ["El remachero"],
            isCompleted: false
        ),
        Mission(
            title: "Busca la olla de fundición",
            location: "Galeria de historia",
            expectedLabel: "Tina",
            acceptedLabels: ["Tina"],
            isCompleted: false
        )
    ]
    
    func completeMission(id: UUID) {
        guard let index = missions.firstIndex(where: { $0.id == id }) else { return }
        missions[index].isCompleted = true
    }
    
    func matchesMission(_ mission: Mission, detectedLabel: String, confidence: Double) -> Bool {
        let normalizedDetected = normalize(detectedLabel)
        let normalizedAccepted = mission.acceptedLabels.map(normalize)
        
        return confidence >= 0.80 && normalizedAccepted.contains(normalizedDetected)
    }
    
    private func normalize(_ text: String) -> String {
        text
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
