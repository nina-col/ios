//
//  AddTravelGoalSheet.swift
//  Friends
//
//  Created by Magda on 09/03/26.
//

import SwiftUI
import SwiftData

struct AddTravelGoalSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var name: String = ""
    @State private var dateAdded : Date = .now
    @State private var visited: Bool = false
    @State private var priority: Double = 0
    @State private var notes: String = ""
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Item", text:$name)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                DatePicker("Date limit", selection: $dateAdded, displayedComponents: .date)
                Toggle("Visited", isOn: $visited)
                Text("Priority: \(Int(priority))%")
                        .font(.headline)

                    Slider(value: $priority, in: 0...100, step: 1)
                TextField("Notes", text:$notes)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
            }
            .navigationTitle("Trip")
            .navigationBarTitleDisplayMode( .large )
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        
                        let Recordatorio = TravelGoal(name: name, dateAdded: dateAdded, visited: visited, priority: priority, notes: notes)
                        
                        context .insert(Recordatorio)
                        try! context.save()
                        dismiss()
                    }
                    .disabled(!TravelGoal.isValidName(name))
                    
                    }
                }
            }
        
        }
    }



#Preview {
    AddTravelGoalSheet()
}
