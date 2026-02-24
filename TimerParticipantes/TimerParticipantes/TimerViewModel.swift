//
//  TimerViewModel.swift
//  TimerParticipantes
//
//  Created by Magda on 30/10/25.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Modelo de datos
struct Registro: Identifiable {
    let id = UUID()
    let participante: String
    let turno: String
    let minutosObjetivo: Double
    let segundosTranscurridos: Int
}

// MARK: - ViewModel
class TimerViewModel: ObservableObject {
    @Published var registros: [Registro] = []
    @Published var tiempoRestante: Int = 0
    @Published var tiempoObjetivo: Int = 0
    @Published var enCurso = false
    @Published var colorActual: Color = .green
    @Published var participante = ""
    @Published var turno = ""
    @Published var minutos: Double = 1.0
    
    private var timer: Timer?
    private var inicio: Date?
    
    func iniciarTurno() {
        guard !enCurso else { return }
        
        tiempoObjetivo = Int(minutos * 60)
        tiempoRestante = tiempoObjetivo
        inicio = Date()
        colorActual = .green
        enCurso = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.actualizarTiempo()
        }
    }
    
    func finalizarTurno() {
        guard enCurso else { return }
        timer?.invalidate()
        let transcurrido = tiempoObjetivo - tiempoRestante
        let registro = Registro(participante: participante,
                                turno: turno,
                                minutosObjetivo: minutos,
                                segundosTranscurridos: transcurrido)
        registros.append(registro)
        
        enCurso = false
        participante = ""
        turno = ""
        minutos = 1.0
        colorActual = .green
        tiempoRestante = 0
        tiempoObjetivo = 0
    }
    
    func actualizarTiempo() {
        guard tiempoRestante > 0 else {
            timer?.invalidate()
            enCurso = false
            colorActual = .red
            return
        }
        
        tiempoRestante -= 1
        
        if tiempoRestante <= 20 {
            colorActual = .red
        } else if tiempoRestante <= tiempoObjetivo / 2 {
            colorActual = .yellow
        } else {
            colorActual = .green
        }
    }
    
    func exportarCSV() {
        let header = "Participante,Turno,Minutos Objetivo,Segundos Transcurridos\n"
        let rows = registros.map {
            "\($0.participante),\($0.turno),\($0.minutosObjetivo),\($0.segundosTranscurridos)"
        }.joined(separator: "\n")
        let csv = header + rows
        
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("resultados_timer.csv")
        do {
            try csv.write(to: url, atomically: true, encoding: .utf8)
            print("✅ Archivo CSV exportado a: \(url.path)")
        } catch {
            print("⚠️ Error al exportar CSV: \(error)")
        }
    }
}
