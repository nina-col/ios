import Foundation

struct Speech: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var title: String
    var minutes: Int
    var audience: String
    var purpose: String
    var draftText: String
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
}
