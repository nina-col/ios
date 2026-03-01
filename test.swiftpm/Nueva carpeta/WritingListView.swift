import SwiftUI

struct WritingListView: View {
    
    var onBack: (() -> Void)? = nil
    var onSelectEssay: (() -> Void)? = nil
    var onCreateNew: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Header
            ZStack {
                AppColors.green1
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 120)
                
                HStack {
                    Button("Back") {
                        onBack?()
                    }
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("Writing")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 80, height: 28)
                        .overlay(
                            Text("4 speeches")
                                .font(.caption)
                                .foregroundStyle(.white)
                        )
                }
                .padding(.horizontal)
                .padding(.top, 50)
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    
                    // MARK: - New Speech Button
                    Button {
                        onCreateNew?()
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Write new speech")
                        }
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(AppColors.green1.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(radius: 4)
                    }
                    
                    // MARK: - Example Card 1
                    EssayCardView(
                        title: "The illusion of choice",
                        time: "5 minutes",
                        description: "Essay about...",
                        tag1: "Persuasion",
                        tag2: "Audience: Teens"
                    ) {
                        onSelectEssay?()
                    }
                    
                    // MARK: - Example Card 2
                    EssayCardView(
                        title: "Benefits of nature in health",
                        time: "7 minutes",
                        description: "This speech is about...",
                        tag1: "Informative",
                        tag2: "Audience: Moms"
                    ) {
                        onSelectEssay?()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    WritingListView()
}



private struct EssayCardView: View {
    let title: String
    let time: String
    let description: String
    let tag1: String
    let tag2: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Title: \(title)")
                    .font(.headline)
                
                HStack {
                    Image(systemName: "clock")
                    Text("Time: \(time)")
                        .font(.caption)
                }
                .foregroundStyle(.secondary)
                
                Text(description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                
                HStack {
                    TagView(text: tag1, color: .green)
                    TagView(text: tag2, color: .orange)
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
        }
        .buttonStyle(.plain)
    }
}

private struct TagView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}
