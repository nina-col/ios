//
//  StepAnalyzer.swift
//  StepIntelligence
//
//  Created by Research and Development Tec de Monterrey on 09/03/26.
//

import Foundation
import FoundationModels
import Observation

@Observable
class StepAnalyzer {

    private let session: LanguageModelSession

    init() {
        session = LanguageModelSession(
            instructions: """
            You are a personal wellness companion.
            Rules you must always follow:
            1. Never repeat numbers or statistics — the user can already see those.
            2. Focus on how the data makes the user FEEL and what it means for their day.
            3. Your suggestedAction must be specific and creative —
               not generic advice like "go for a walk" or "stay hydrated".
            4. Tailor suggestions to realistic moments: a 5-minute stretch,
               taking the stairs, a quick walk around the block.
            5. Keep your summary under 30 words.
            6. Never give medical advice or mention calories, BMI, or heart rate zones.
            7. Be warm, human, and encouraging.
            """
        )
    }

    func generateRecommendation(for data: StepData) async throws -> WellnessInsight {
        let model = SystemLanguageModel.default

        switch model.availability {
        case .available:
            break
        case .unavailable(.deviceNotEligible):
            throw StepAnalyzerError.modelUnavailable
        case .unavailable(.modelNotReady):
            throw StepAnalyzerError.modelNotReady
        case .unavailable(_):
            throw StepAnalyzerError.modelUnavailable
        @unknown default:
            throw StepAnalyzerError.modelUnavailable
        }

        let trendText: String
        switch data.trend {
        case .increasing:
            trendText = "above your weekly average — great work"
        case .decreasing:
            trendText = "below your weekly average"
        case .stable:
            trendText = "close to your weekly average"
        }

        let prompt = """
        User's step data:
        - Steps today: \(data.stepsToday)
        - 7-day average: \(data.weeklyAverage) steps/day
        - Least active day this week: \(data.leastActiveDay)
        - Today's activity is \(trendText).

        Generate a wellness insight and a concrete suggestion
        the user can act on today.
        """

        let response = try await session.respond(
            to: prompt,
            generating: WellnessInsight.self
        )

        return response.content
    }

    enum StepAnalyzerError: LocalizedError {
        case modelUnavailable
        case modelNotReady

        var errorDescription: String? {
            switch self {
            case .modelUnavailable:
                return "On-device AI is not available on this device."
            case .modelNotReady:
                return "The AI model is still loading. Please try again shortly."
            }
        }
    }
}

@Generable(description: "A wellness insight based on step data with a summary and suggested action")
struct WellnessInsight {
    @Guide(description: "A positive 1–2 sentence summary of the user's activity level. Under 30 words.")
    var summary: String

    @Guide(description: "One specific action the user can do right now. Single imperative sentence starting with a verb.")
    var suggestedAction: String
}
