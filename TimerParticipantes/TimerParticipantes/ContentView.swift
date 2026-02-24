//
//  ContentView.swift
//  TimerParticipantes
//
//  Created by Magda on 30/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = TimerViewModel()
    @State private var mostrandoFormulario = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Nuevo registro") {
                    mostrandoFormulario = true
                }
                .buttonStyle(.borderedProminent)
                
                Button("Finalizar sesión (exportar resultados)") {
                    vm.exportarCSV()
                }
                .buttonStyle(.bordered)
            }
            .padding()
            
            Spacer()
            
            ZStack {
                vm.colorActual
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text(vm.enCurso ? "\(vm.participante) – \(vm.turno)" : "Sin turno activo")
                        .font(.title2)
                        .bold()
                    
                    Text(formatearTiempo(vm.tiempoRestante))
                        .font(.system(size: 72, weight: .bold, design: .rounded))
                        .monospacedDigit()
                    
                    if vm.enCurso {
                        Button("Finalizar turno") {
                            vm.finalizarTurno()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                    }
                }
            }
            .frame(maxHeight: 300)
            
            Divider()
            
            // Tabla de registros
            List(vm.registros) { r in
                HStack {
                    Text(r.participante)
                    Spacer()
                    Text(r.turno)
                    Spacer()
                    Text(String(format: "%.1f min", r.minutosObjetivo))
                    Spacer()
                    
                    Text(formatearTiempo(r.segundosTranscurridos))
                }
            }
        }
        .sheet(isPresented: $mostrandoFormulario) {
            FormularioNuevoRegistro(vm: vm, mostrar: $mostrandoFormulario)
        }
    }
    
    func formatearTiempo(_ segundos: Int) -> String {
        let m = segundos / 60
        let s = segundos % 60
        return String(format: "%02d:%02d", m, s)
    }
}

#Preview {
    ContentView()
}
