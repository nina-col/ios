//
//  EditTravelGoalSheet.swift
//  Friends
//
//  Created by Magda on 09/03/26.
//


import SwiftUI
import SwiftData

struct EditTravelGoalSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @Bindable var travelGoal: TravelGoal
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Item", text: $travelGoal.name)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                
                DatePicker("Date limit", selection: $travelGoal.dateAdded, displayedComponents: .date)
                
                Toggle("Priority", isOn: $travelGoal.visited)
                
                TextField("Notes", text: $travelGoal.notes)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
            }
            .navigationTitle("Edit to do list")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        do {
                            try context.save()
                            dismiss()
                        } catch {
                            print("No se pudo guardar: \(error)")
                        }
                    }
                    .disabled(!TravelGoal.isValidName(travelGoal.name))
                }
            }
        }
    }
}
