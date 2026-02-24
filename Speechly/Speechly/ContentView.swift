//
//  ContentView.swift
//  Speechly
//
//  Created by Magda on 19/02/26.
//

import SwiftUI

struct ContentView: View {

    @State private var speechVM = SpeechViewModel()

    var body: some View {

        NavigationStack {

            ZStack {


                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Write your draft")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)

                            Spacer()

                            Text("\(speechVM.arrSpeeches.count) speeches")
                                .font(.subheadline)
                                .bold()
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.white)
                                .clipShape(Capsule())
                                .foregroundColor(.purple)
                        }
                        .padding()
                        
                        .background(Color("purple1"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal)

                
                        Button {
                            print("Write new speech")
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: "plus")
                                Text("Write new speech")
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color("green1"))
                            .clipShape(Capsule())
                        }
                        .padding(.horizontal)

                        //Cards
                        LazyVStack(spacing: 18) {
                            ForEach(speechVM.arrSpeeches) { speech in
                                NavigationLink {
                                    Text("The ilusion of choice. this essay is about ")
                                } label: {
                                    SpeechCardRow(speech: speech)
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal)
                            }
                        }

                     
                    }
                    .padding(.top, 10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
