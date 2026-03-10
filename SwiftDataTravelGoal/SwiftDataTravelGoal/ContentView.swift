//
//  ContentView.swift
//  SwiftDataTravelGoal
//
//  Created by Magda on 05/03/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context //para borrar y gardar
    @State private var isShowingItemSheet: Bool = false
    //var travelgoals : [TravelGoal] = []
    @Query(sort: \TravelGoal.dateAdded) var travelgoals : [TravelGoal]
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(travelgoals){
                    travelgoal in
                    Button {
                        //editingItem = travelgoal
                    } label: {
                        Text(travelgoal.name)
                        
                    }
                    
                }
                
                
                .onDelete(perform: delete)
                
            }
            .navigationTitle("Travel Goals")
            .navigationBarTitleDisplayMode( .large )
            .sheet(isPresented: $isShowingItemSheet) {
                AddTravelGoalSheet()}
            
            .toolbar{
                Button("Add", systemImage: "plus"){
                    isShowingItemSheet = true
                    
                }
            }
        }
        .padding()
    }
    private func delete(at offsets: IndexSet){
        for index in offsets {
            context.delete(travelgoals[index])
        }
        do {
            try context.save()
            
        }
        catch {
            print("no se pudo borrar")
        }
    }
    
    
}
#Preview {
    ContentView()
        .modelContainer(for: [TravelGoal.self], inMemory: true)
}
