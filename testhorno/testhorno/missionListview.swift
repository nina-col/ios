//
//  missionListview.swift
//  testhorno
//
//  Created by Magda on 14/03/26.
//

import SwiftUI

struct MissionListView: View {
    
    @StateObject var viewModel = MissionViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 26) {
                        ForEach(viewModel.missions) { mission in
                            NavigationLink {
                                CameraMissionView(mission: mission)
                                    .environmentObject(viewModel)
                            } label: {
                                MissionRowView(mission: mission)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 24)
                }
            }
            .navigationTitle("Misiones")
        }
    }
}

#Preview {
    MissionListView()
}
