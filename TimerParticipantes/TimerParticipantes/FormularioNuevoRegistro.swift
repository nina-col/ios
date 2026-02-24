//
//  FormularioNuevoRegistro.swift
//  TimerParticipantes
//
//  Created by Magda on 30/10/25.
//

import SwiftUI

struct FormularioNuevoRegistro: View {
    @ObservedObject var vm: TimerViewModel
    @Binding var mostrar: Bool
    
    var body: some View {
        VStack {
            Text("Nuevo registro")
                .font(.headline)
                .padding(.top, 12)
            
            Form {
                TextField("Nombre del participante", text: $vm.participante)
                TextField("Nombre del turno", text: $vm.turno)
                Stepper(value: $vm.minutos, in: 0.5...60, step: 0.5) {
                    Text("Duración: \(vm.minutos, specifier: "%.1f") min")
                }
            }
            .frame(minWidth: 320, minHeight: 200)
            .padding(.horizontal)
            
            HStack {
                Button("Cancelar") {
                    mostrar = false
                }
                .keyboardShortcut(.cancelAction)
                
                Spacer()
                
                Button("Iniciar") {
                    vm.iniciarTurno()
                    mostrar = false
                }
                .keyboardShortcut(.defaultAction)
                .disabled(vm.participante.isEmpty || vm.turno.isEmpty)
            }
            .padding()
        }
        .frame(minWidth: 380, minHeight: 260) // <-- Forzar tamaño visible
        .padding()
    }
}

#Preview {
    FormularioNuevoRegistro(vm: TimerViewModel(), mostrar: .constant(true))
}


#Preview {
    FormularioNuevoRegistro(vm: TimerViewModel(), mostrar: .constant(true))
}
