//
//  ContentView.swift
//  health
//
//  Created by Magda on 09/03/26.
//

import SwiftUI
import Observation

struct ContentView: View {
    @State private var viewModel = StepsViewModel()

    var body: some View {
        ContentBodyView(viewModel: viewModel)
            .task {
                await viewModel.load()
            }
    }
}

struct ContentBodyView: View {
    let viewModel: StepsViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Step Recommender")
                    .font(.largeTitle)
                    .bold()

                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                } else if let stepData = viewModel.stepData,
                          let insight = viewModel.insight {

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Steps Today: \(stepData.stepsToday)")
                        Text("Weekly Average: \(stepData.weeklyAverage)")
                        Text("Least Active Day: \(stepData.leastActiveDay)")
                        Text("Trend: \(trendText(stepData.trend))")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Summary")
                            .font(.headline)

                        Text(viewModel.insight?.summary ?? "")

                        Text("Suggested Action")
                            .font(.headline)
                            .padding(.top, 8)

                        Text(viewModel.insight?.suggestedAction ?? "")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.blue.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    Text("Tap the button to load your step data.")
                        .foregroundStyle(.secondary)
                }

                Button("Refresh") {
                    Task {
                        await viewModel.load()
                    }
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
            .navigationTitle("Health")
        }
    }

    private func trendText(_ trend: ActivityTrend) -> String {
        switch trend {
        case .increasing:
            return "Increasing"
        case .decreasing:
            return "Decreasing"
        case .stable:
            return "Stable"
        }
    }
}

#Preview {
    let vm = StepsViewModel()
    vm.stepData = StepData(
        stepsToday: 8421,
        weeklySteps: [6200, 7100, 6800, 7900, 8421, 7300, 7600],
        weeklyAverage: 7331,
        leastActiveDay: "Mon",
        trend: .increasing
    )
    vm.insight = WellnessInsight(
        summary: "You’re building strong momentum today and it shows in your rhythm.",
        suggestedAction: "Take a brisk five-minute lap after your next break to keep the streak alive."
    )

    return ContentBodyView(viewModel: vm)
}
