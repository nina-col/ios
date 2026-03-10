//
//  TarvelGoalListView.swift
//  SwiftDataTravelGoal
//
//  Created by Magda on 05/03/26.
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
