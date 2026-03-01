import SwiftUI

@MainActor
final class AppRouter: ObservableObject {
    enum Route: Hashable {
        case dashboard
        case writingList
        case writingDetail(UUID)
        case writingCorrections(UUID)
    }
    
    @Published var path: [Route] = []
    
    func goToWritingList() { path.append(.writingList) }
    func goToDetail(id: UUID) { path.append(.writingDetail(id)) }
    func goToCorrections(id: UUID) { path.append(.writingCorrections(id)) }
    
    func back() { _ = path.popLast() }
    func resetToDashboard() { path.removeAll() }
}
