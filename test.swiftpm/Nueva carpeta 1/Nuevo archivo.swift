import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {
    @Published var dateText: String = "February 16"
    @Published var streakDays: Int = 3
    
    @Published var wordTitle: String = "Abstruse"
    @Published var wordDefinition: String = "difficult to comprehend."
    @Published var wordExample: String = "The abstruse calculations of mathematicians"
    @Published var wordExtra: String = "abstruse concepts/ideas/theories"
}
