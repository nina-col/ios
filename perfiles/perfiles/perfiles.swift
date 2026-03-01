//
//  perfiles.swift
//  perfiles
//
//  Created by Magda on 26/02/26.
//

import SwiftUI

struct perfiles: View {
    
    let avatars = ["Memoji1", "Memoji2", "Memoji3", "memoji 4"]
    @State private var selectedAvatar = "memoji 4"
    @State private var zoomLevel: CGFloat = 1.0 //zoom
    @State private var backgroundColor: Color = .gray //Color fondo memoji

    @State private var isProfilePublic = false
    @State private var notificationsEnabled = false
    //@State private var darkmode = false
    @State private var isDark = false
    
    
    var body: some View {
        VStack {
            Text("Perfil")
                .font(.largeTitle)
                .bold()
            
            Image(selectedAvatar)
                .resizable()
                .scaledToFit()
                .frame(width:200)
                .background(Circle().fill(backgroundColor.opacity(0.8)).frame(width: 200))
                .clipShape(Circle())
                .shadow(radius: 5)
                .scaleEffect(zoomLevel) //scala la imagen de acuerdo al valor de zoom
                .padding()
            
            //Picker para imagen de memoji
            Picker("Elige tu avatar", selection: $selectedAvatar) {
                ForEach(avatars, id: \.self) { avatar in
                    Text(avatar)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            HStack{
                Text("Zoom a Imagen:")
                Slider(value: $zoomLevel, in: 1...1.3, step: 0.1)
            }
            .padding()
            
            //Picker color
            ColorPicker("Selecciona Color Fondo Memoji", selection: $backgroundColor)
                .padding()
            
            //Agrega una linea divisoria
            Divider()
          
            HStack {
                //modo nocturno, le daz click al sol o a la luna y cambia de light mode a darkmode
                
                Text("Modo")
                Spacer()
                Button {
                    isDark.toggle()
                } label: {
                    Image(systemName: isDark ? "moon.fill" : "sun.max.fill")
                        .font(.system(size: 28))
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
            }
            .padding()
            
            Toggle(isOn: $isProfilePublic) {
                Text(isProfilePublic ? "Perfil Público" : "Perfil Privado")
            }
            .padding()
            
            Toggle(isOn: $notificationsEnabled) {
                Text(notificationsEnabled ? "Notificaciones Activadas" : "Notificaciones Desactivadas")
            }
            
            /*Toggle(isOn: $darkmode){
                Text(darkmode ? "Dark mode" : "Light mode", )
            }
            .preferredColorScheme(darkmode ? .dark : .light)
            
            
            */
            .padding()
            
            

                    }
        
                    .preferredColorScheme(isDark ? .dark : .light)
            
        }
       
    }


#Preview {
    perfiles()
}
