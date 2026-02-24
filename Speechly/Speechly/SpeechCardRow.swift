//
//  SpeechCardRow.swift
//  Speechly
//
//  Created by Magda on 19/02/26.
//

import SwiftUI

struct SpeechCardRow: View {

    let speech: Speech

    var body: some View {

        VStack(spacing: 0) {


            // Content bottom
            VStack(alignment: .leading, spacing: 10) {
                Text("Title: \(speech.title)")
                    .font(.headline)
                    .foregroundColor(.purple)

                HStack(spacing: 8) {
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                    Text("Time: 5 minutes")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                    
                }

                Text("this esssay is about.....")
                    .foregroundColor(.gray)
                Image(speech.imageName[0])
                    .resizable()
                        .scaledToFill()
                        .frame(height: 140)
                        .clipped()
                HStack(spacing: 10) {
                    Text("Presentation")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.green.opacity(0.3))
                        .clipShape(Capsule())

                    Text("Easy")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.purple.opacity(0.3))
                        .clipShape(Capsule())
                    
                
                    
                    Spacer()
                }
                
            }
            .padding()
            .background(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}
#Preview {
    SpeechCardRow(
            speech: Speech(
                name: "The ilusion of choise",
                title: "The illusion of choice",
                description: "this esssay is about how cocial media modify our position.....",
                imageName: ["palomitas"]
            )
        )
}
