//
//  StepViewModel.swift
//  StepIntelligence
//
//  Created by Research and Development Tec de Monterrey on 09/03/26.
//

import Foundation
import Observation

@Observable
class StepsViewModel {

    var stepData: StepData?
    var insight: WellnessInsight?
    var isLoading = false
    var errorMessage: String?

    private let healthKit = HealthKitService()
    private let analyzer = StepAnalyzer()

    func load() async {
        isLoading = true
        errorMessage = nil

        do {
            try await healthKit.requestAuthorization()
            let data = try await healthKit.fetchStepContext()
            stepData = data
            insight = try await analyzer.generateRecommendation(for: data)
        } catch StepAnalyzer.StepAnalyzerError.modelUnavailable {
            errorMessage = "On-device AI is not available on this device."
        } catch StepAnalyzer.StepAnalyzerError.modelNotReady {
            errorMessage = "AI model is still loading. Tap Refresh in a moment."
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
