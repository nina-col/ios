//
//  FriendsTests.swift
//  FriendsTests
//
//  Created by Magda on 09/03/26.
//


//import XCTest

import Testing
@testable import Friends
import Foundation

struct FriendsTests {
    
    @Test("Name must not be empty or whitespace")
    func testNameValidation() {
        #expect(!TravelGoal.isValidName(""))
        #expect(!TravelGoal.isValidName("  "))
        #expect(TravelGoal.isValidName("Cupertino"))
    }
        
        
    @Test("date must be future date")
       func futureDateValidation() {
           let pastDate = Date().addingTimeInterval(-86400)
           let futureDate = Date().addingTimeInterval(86400)
           
           #expect(!TravelGoal.isValidDate(pastDate))
           #expect(TravelGoal.isValidDate(futureDate))
       }
    
    
    @Test("priority must be above cero")
       func priorityValidation() {
           #expect(!TravelGoal.hasValidPriority(0))
           #expect(TravelGoal.hasValidPriority(1))
           #expect(TravelGoal.hasValidPriority(50))
        
       }
}


