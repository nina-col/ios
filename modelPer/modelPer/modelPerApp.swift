//
//  modelPerApp.swift
//  modelPer
//
//  Created by Magda on 05/03/26.
//

import SwiftUI
import SwiftData


@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
