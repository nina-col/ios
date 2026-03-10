//
//  TravelGoalListView.swift
//  Friends
//
//  Created by Magda on 09/03/26.
//

import SwiftUI


struct TravelGoalListView: View {
    var travelgoals = [TravelGoal]()
    var body: some View {
        NavigationStack{
            List{
                ForEach(travelgoals) { item in
                    Text(item.name)
                    
                    
                    
                }
                
                
                    
                }
            }
        }
    }


#Preview {
    TravelGoalListView()
}
