//
//  SwiftDataTravelGoalApp.swift
//  SwiftDataTravelGoal
//
//  Created by Magda on 05/03/26.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTravelGoalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TravelGoal.self])
    }
}


/*
 import XCTest

 import Testing
 @testable import SwiftDataTravelGoal

 struct SwiftDataTravelGoalTests {
     
     @Test("Name must not be empty or whitespace")
     func testNameValidation() {
         #expect(!TravelGoal.isValidName(""))
         #expect(!TravelGoal.isValidName("  "))
         #expect(TravelGoal.isValidName("Cupertino"))
         
         
         
     }
 }

 */
