//
//  EditTravelGoal.swift
//  SwiftDataTravelGoal
//
//  Created by Magda on 05/03/26.
//

import SwiftUI
import SwiftData

struct EditTravelGoalSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var name: String = ""
    @State private var dateAdded : Date = .now
    @State private var visited: Bool = false
    @State private var notes: String = ""
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Item", text:$name)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                DatePicker("Date limit", selection: $dateAdded, displayedComponents: .date)
                Toggle("Priority", isOn: $visited)
                TextField("Notes", text:$notes)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
            }
            .navigationTitle("To do list")
            .navigationBarTitleDisplayMode( .large )
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        
                        let Recordatorio = TravelGoal(name: name, dateAdded: dateAdded, visited: visited, notes: notes)
                        
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
    EditTravelGoalSheet()
}
