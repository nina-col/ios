import Foundation

@MainActor
final class WritingCorrectionsViewModel: ObservableObject {
    @Published var speech: Speech
    @Published var suggestions: [String] = []
    
    private let store: SpeechStore
    
    init(store: SpeechStore, speech: Speech) {
        self.store = store
        self.speech = speech
    }
    
    func runCheck() {
        suggestions = [
            "Replace vague phrases with concrete examples for your audience.",
            "Shorten long sentences. Aim for 12–18 words per sentence.",
            "Add a quick hook in the first 10 seconds (question or surprise fact)."
        ]
    }
    
    func save() {
        store.update(speech)
    }
}
