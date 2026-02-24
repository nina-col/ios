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

            // Image top
            ZStack(alignment: .topTrailing) {
                Image(speech.imageName[0])
                    .resizable()
                    .scaledToFill()
                    .frame(height: 190)
                    .clipped()

                // Small badge (mockup has a number)
                HStack(spacing: 6) {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("8").bold()
                }
                .font(.subheadline)
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(Color.white)
                .clipShape(Capsule())
                .foregroundColor(.purple)
                .padding(12)
            }

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

                Text("Essay about ....")
                    .foregroundColor(.gray)

                HStack(spacing: 10) {
                    Text("15 hectáreas")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.green.opacity(0.3))
                        .clipShape(Capsule())

                    Text("8 lotes")
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
