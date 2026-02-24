//
//  PlaceRowView.swift
//  Places
//
//  Created by Magda on 16/02/26.
//

import SwiftUI

struct PlaceRow: View {
    let place: Place
    var body: some View {
        VStack{
            HStack {
                Image(place.imageName[0])
                    .resizable()
                    .scaledToFit( )
                    .frame(width:100)
                Text(place.name)
            }
        }
    }
}

#Preview {
    PlaceRow(place:Place(id: "1", name: "ChichenItza", title: "Chichen Itza", description: "Chichen Itza is a famous ancient Mayan city in Mexico, known for its impressive pyramid Kukulkan. It was a major center of politics, religion, and astronomy, and is now one of the New Seven Wonders of the World.", videoURL: "https://www.youtube.com/watch?v=sO7U78pUr34", imageName: ["ChichenItza"]))
}
