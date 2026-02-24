//
//  Tarjeta.swift
//  artLapse
//
//  Created by Magda on 10/02/26.
//

import SwiftUI

struct Tarjeta: View {
    let images = ["A1", "A2", "A7", "A4", "A5", "A6"]
    var index: Int
    let autor = ["alexa_04", "army_02", "rudy_01", "magda_00", "alicia_90", "betito_02"]

    
    
    @State private var isScaled = false
    var body: some View {
        
        
            VStack {
                Image(images[index])
                    .resizable()
                    
                    .cornerRadius(20)
                    .scaleEffect(isScaled ? 0.9 : 1.0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)){
                            isScaled.toggle()}}
                    
                HStack {
                    Spacer()
                    Image(images[index])
                        .resizable()
                        .frame(width: 20)
                        .clipShape(Circle())
                        
                    Text(autor[index])
                        .bold(true)
                    Spacer()
                        
                    
                    
                }
                
                
            }
        
        
    }
}

#Preview {
    Tarjeta(index: 0)
}
