//
//  ContentView.swift
//  Places
//
//  Created by Magda on 16/02/26.
//

import SwiftUI

struct ContentView: View {
    @State var placeVM = PlaceViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(placeVM.arrPlaces){ place in
                        NavigationLink{
                            Text("Destination")
                        } label:{
                            PlaceRowView(place: place)
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

