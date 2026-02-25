//
//  ContentView.swift
//  PaintMagda
//
//  Created by Magda on 24/02/26.
//

import SwiftUI

struct ContentView: View {
    @State var vm = PaintViewModel()
    //state observa cambios y actualiza
    
    var busqueda = "Impressionism"
    var body: some View {
        
        
        
        NavigationStack {
            VStack {
                
                
                if vm.items.isEmpty {
                    VStack(spacing: 8) {
                        ProgressView("Cargando")}
                        
                    //aqui imprimimos el error pero mejor usamos un do catch
                    if let error = vm.lastError {
                        Text(error).font(.caption).foregroundStyle(.secondary)}

                    
                } else {
                    Text("Met Musueum")
                        .foregroundColor(.blanco)
                        .bold()
                        .background(Color.rojo)
                        .font(.system(size: 28, weight: .medium, design: .serif))
                        .padding()
                        Text(busqueda)
                        .foregroundColor(Color(.gray))
                    List(vm.items) { p in
                                            NavigationLink(
                                                destination: PaintViewDetail(paint: p),
                                                label: { PaintRow(paint: p) }
                                            )
                                        }

                    
                }
            
            }
            
            
            
            
        }
        .task {
            if vm.items.isEmpty {
                await vm.load(search: busqueda)
            }
        }
    }
}

#Preview { ContentView() }
