//
//  ContentView.swift
//  Friends
//
//  Created by Magda on 09/03/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \TravelGoal.dateAdded) private var travelgoals: [TravelGoal]
    
    @State private var isShowingItemSheet = false
    @State private var selectedTravelGoal: TravelGoal?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(travelgoals) { travelgoal in
                    Button {
                        selectedTravelGoal = travelgoal
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(travelgoal.name)
                                .font(.headline)
                            
                            Text(travelgoal.notes)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text("\(Int(travelgoal.priority))% priority")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Travel goals")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingItemSheet = true
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingItemSheet) {
                AddTravelGoalSheet()
            }
            .sheet(item: $selectedTravelGoal) { travelgoal in
                EditTravelGoalSheet(travelGoal: travelgoal)
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            context.delete(travelgoals[index])
        }
        
        do {
            try context.save()
        } catch {
            print("No se pudo borrar: \(error)")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TravelGoal.self, inMemory: true)
}
