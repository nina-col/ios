import SwiftUI

import Foundation

@MainActor
final class SpeechStore: ObservableObject {
    @Published private(set) var speeches: [Speech] = []
    
    private let key = "speechly.speeches.v1"
    
    init() {
        load()
        if speeches.isEmpty {
            // Seed examples
            speeches = [
                Speech(
                    title: "The illusion of choice",
                    minutes: 5,
                    audience: "teens",
                    purpose: "Persuasion",
                    draftText: "Raise your hand how many of you have been in TikTok in the last week?\n\nWe like to believe we are free..."
                ),
                Speech(
                    title: "Benefits of nature in health",
                    minutes: 7,
                    audience: "moms",
                    purpose: "Informative",
                    draftText: "Nature improves health by reducing stress...\n"
                )
            ]
            save()
        }
    }
    
    func addNew() -> Speech {
        let s = Speech(title: "New speech", minutes: 5, audience: "general", purpose: "Informative", draftText: "")
        speeches.insert(s, at: 0)
        save()
        return s
    }
    
    func update(_ speech: Speech) {
        guard let idx = speeches.firstIndex(where: { $0.id == speech.id }) else { return }
        speeches[idx] = speech
        save()
    }
    
    func speech(id: UUID) -> Speech? {
        speeches.first(where: { $0.id == id })
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key) else { return }
        do {
            speeches = try JSONDecoder().decode([Speech].self, from: data)
        } catch {
            speeches = []
        }
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(speeches)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            // ignore for now
        }
    }
}
