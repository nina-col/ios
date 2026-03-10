//
//  FriendsApp.swift
//  Friends
//
//  Created by Magda on 09/03/26.
//

import SwiftUI
import SwiftData

@main
struct ExploreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TravelGoal.self])
    }
}
