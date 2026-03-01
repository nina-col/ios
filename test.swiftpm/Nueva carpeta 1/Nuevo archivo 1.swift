import Foundation

@MainActor
final class WritingListViewModel: ObservableObject {
    @Published private(set) var speeches: [Speech] = []
    
    private let store: SpeechStore
    
    init(store: SpeechStore) {
        self.store = store
        refresh()
    }
    
    func refresh() { speeches = store.speeches }
    
    func createNew() -> Speech {
        let s = store.addNew()
        refresh()
        return s
    }
}
