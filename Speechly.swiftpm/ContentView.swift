import SwiftUI

struct ContentView: View {

    @State private var speechVM = SpeechViewModel()

    var body: some View {

        NavigationStack {

            ZStack {

                Color.gray.opacity(0.1).ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {

                        // Header (like mockup)
                        HStack {
                            Text("Write your speech")
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
                        .background(Color.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal)

                        // Create button
                        Button {
                            print("Write new speech")
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: "plus")
                                Text("Write new speech").bold()
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.green)
                            .clipShape(Capsule())
                        }
                        .padding(.horizontal)

                        // Cards
                        LazyVStack(spacing: 18) {
                            ForEach(speechVM.arrSpeeches) { speech in
                                NavigationLink {
                                    Text("Destination")
                                } label: {
                                    SpeechCardRow(speech: speech)
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal)
                            }
                        }

                        Spacer(minLength: 20)
                    }
                    .padding(.top, 10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
