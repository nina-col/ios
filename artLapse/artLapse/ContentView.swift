//
//  ContentView.swift
//  artLapse
//
//  Created by Magda on 10/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isTap = false
    var body: some View {
        VStack {
            
            HStack{
        Spacer()
                Image(systemName: "magnifyingglass" )
                Spacer()
                Text("Explore")
                    .bold(true)
                    .padding()
                Text("For You")
                    .bold(true)
                    .padding()
                Text("Following")
                    .bold(true)
                Spacer()
                Image(systemName: "line.horizontal.3" )
                Spacer()
                
                
            }
            
            HStack{
                Tarjeta(index: 0)
                
                Tarjeta(index: 2)
            }
            HStack{
                Tarjeta(index: 1)
                Tarjeta(index: 3)
            }
            HStack{
                Tarjeta(index: 4)
                Tarjeta(index: 5)
            }
            
            
            
            Spacer()
            HStack {
                Spacer()
                VStack{
                    Image(systemName: "magnifyingglass" )
                    Text("Search")}
                Spacer()
                VStack {
                    Image(systemName: "bell" )
                    Text("Search")}
                
                
                Spacer()
                VStack {
                    Image(systemName: "message" )
                    Text("Search")}
                
                Spacer()
                VStack {
                    Image(systemName: "clipboard" )
                    Text("Hire")
                }
                Spacer()
            }
        }
    }
    }


#Preview {
    ContentView()
}
