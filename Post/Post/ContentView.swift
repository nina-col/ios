//
//  ContentView.swift
//  Post
//
//  Created by Magda on 09/02/26.
//

import SwiftUI


struct ContentView: View {
    @State private var isScaled = false
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Image("ChichenItza")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text("chichenitza_")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Chichenitza, Yuacatan, Mexico")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                Spacer()
                Image(systemName: "ellipsis")
                
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Image("ChichenItza")
                .resizable()
                .scaledToFit()
            
            HStack{
                
                HStack(spacing: 20){
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .scaleEffect(isScaled ? 1.5 : 1.0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)){
                                isScaled.toggle()
                                
                            }
                        }
                    Image(systemName: "message")
                    Image(systemName: "paperplane")
                }
                Spacer()
                Image(systemName: "bookmark")
            }
            //pone los iconos mas grandes y el padding nos ayuda a que haya una separacion entre la imagen
            .font(.title2)
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            VStack(alignment: .leading){
                Text("chichenitza_")
                    .fontWeight(.bold) + Text(" Chichenitza es una antigua ciudad maya. Este sitio arqueologico es un testimonio del ingenio y la habitabilidad de una cultura que dejo un legado perdurable en la historia de la humanidad.")
            }
            
            
            HStack{
                Text("Nov 24, 2024")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                
                
            }
            Divider() //linea de division
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom,10)
    }
}

#Preview {
    ContentView()
}
