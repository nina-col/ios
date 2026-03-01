import Foundation

@MainActor
final class WritingDetailViewModel: ObservableObject {
    @Published var speech: Speech
    private let store: SpeechStore
    
    init(store: SpeechStore, speech: Speech) {
        self.store = store
        self.speech = speech
    }
    
    var timeText: String { "\(speech.minutes) minutes" }
    
    func save() {
        var updated = speech
        updated.updatedAt = Date()
        store.update(updated)
        speech = updated
    }
}
