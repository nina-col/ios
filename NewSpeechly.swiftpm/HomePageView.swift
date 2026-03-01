//
//  HomePageView.swift
//  NewSpeechly
//
//  Created by Magda on 28/02/26.
//

import SwiftUI

struct HomePageView: View {

    var onStart: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color("background1")
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 40, style: .continuous)
                        .fill(Color("purple1"))
                        .frame(width: 240, height: 160)
                        .shadow(radius: 12, y: 6)

                    Text("Speechly")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }

                Text("Speak with confidence")
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.75))

                Spacer()

                Button {
                    onStart?()
                } label: {
                    Text("Start")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color("green1"))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .shadow(radius: 6, y: 4)
                }
                .padding(.horizontal, 26)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    HomePageView()
}
