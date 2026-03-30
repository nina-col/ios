//
//  cardview.swift
//  testhorno
//
//  Created by Magda on 14/03/26.
//
import SwiftUI

struct MissionRowView: View {
    
    let mission: Mission
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 10) {
                Text(mission.title)
                    .font(.system(size: 20, weight: .bold))
                
                Text("Ubicación: \(mission.location)")
                    .font(.system(size: 14, weight: .semibold))
            }
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.85))
                    .frame(width: 45, height: 45)
                
                Image(systemName: mission.isCompleted ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)
                    .foregroundStyle(mission.isCompleted ? .green : .red)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(mission.isCompleted ? Color(.systemGray6) : Color.orange)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.gray.opacity(0.45), lineWidth: 1)
        )
        .foregroundStyle(mission.isCompleted ? .black : .white)
    }
}

#Preview {
    MissionRowView(
        mission: Mission(
            title: "Busca la maquina de escribir",
            location: "Galeria de historia",
            expectedLabel: "maquina_escribir",
            acceptedLabels: ["maquina_escribir", "maquina de escribir"],
            isCompleted: false
        )
    )
}
