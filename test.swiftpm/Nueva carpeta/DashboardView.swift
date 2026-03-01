import SwiftUI

struct DashboardView: View {
    let dateText: String
    let streakDays: Int
    
    let wordTitle: String
    let wordDefinition: String
    let wordExample: String
    let wordExtra: String
    
    var onTapWrite: (() -> Void)? = nil
    var onTapPractice: (() -> Void)? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(AppColors.green1)
                        .frame(height: 140)
                    
                    Text(dateText)
                        .font(.title3)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                }
                .padding(.horizontal)
                .padding(.top)
                
                WordOfDayCard(
                    word: wordTitle,
                    definition: wordDefinition,
                    example: wordExample,
                    extra: wordExtra
                )
                .padding()
                
                StreakCard(days: streakDays)
                    .padding()
                
                HStack(spacing: 16) {
                    ActionCard(
                        title: "Write your speech",
                        subtitle: "write and review with ai",
                        icon: "square.and.pencil",
                        color: AppColors.purple1
                    ) { onTapWrite?() }
                    
                    ActionCard(
                        title: "Practice your speech",
                        subtitle: "Review your grammar and\nfiller words",
                        icon: "mic.fill",
                        color: AppColors.purple1
                    ) { onTapPractice?() }
                }
                .padding(.horizontal)
                
                Spacer(minLength: 120)
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Components

private struct WordOfDayCard: View {
    let word: String
    let definition: String
    let example: String
    let extra: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            
            Image(systemName: "book.closed")
                .font(.title3)
                .foregroundStyle(.white)
                .padding(10)
                .background(Color.white.opacity(0.25))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Word of the day")
                    .font(.headline)
                    .foregroundStyle(.white)
                
                (Text("\(word): ").bold() + Text(definition))
                    .font(.body)
                    .foregroundStyle(.white)
                
                Text("eg.\n\(example)\n\(extra)")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.85))
                    .lineLimit(3)
            }
            
            Spacer()
        }
        .padding()
        .background(AppColors.purple1)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(radius: 6, y: 5)
    }
}

private struct StreakCard: View {
    let days: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(spacing: 6) {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .foregroundStyle(.orange)
                Text("Streak")
                    .font(.headline)
            }
            
            HStack(spacing: 12) {
                ForEach(0..<max(1, min(days, 7)), id: \.self) { _ in
                    Image(systemName: "flame.fill")
                        .font(.title2)
                        .foregroundStyle(.orange)
                }
            }
            
            Text("\(max(days, 1)) day streak!")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.black.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(radius: 6, y: 5)
    }
}

private struct ActionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.white.opacity(0.25))
                        .clipShape(Circle())
                    Spacer()
                }
                
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.85))
            }
            .padding()
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .shadow(radius: 6, y: 5)
        }
        .buttonStyle(.plain)
    }
}
