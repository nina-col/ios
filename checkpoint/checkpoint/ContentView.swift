//
//  ContentView.swift
//  checkpoint
//
//  Created by Magda on 02/03/26.
//

import SwiftUI

struct ContentView: View {
    @State var paintVM = PaintViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(paintVM.arrPaint){ paint in
                        NavigationLink {
                            Text("Cada detalle")
                        } label:{
                            PaintRow(paint: paint)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

