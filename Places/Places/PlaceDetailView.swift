//
//  PlaceDetailView.swift
//  Places
//
//  Created by Magda on 16/02/26.
//

import SwiftUI

struct PlaceDetailView: View {
    let place: Place
    var body: some View
    VStack{
        Text(place.name)
        Image(place.imageName)
            .resizable()
            .scaledToFit()
            
    }
    }


#Preview {
    
}
