//
//  FriendsTests.swift
//  FriendsTests
//
//  Created by Magda on 09/03/26.
//


//import XCTest

import Testing
@testable import Friends

struct FriendsTests {
    
    @Test("Name must not be empty or whitespace")
    func testNameValidation() {
        #expect(!TravelGoal.isValidName(""))
        #expect(!TravelGoal.isValidName("  "))
        #expect(TravelGoal.isValidName("Cupertino"))
        
        
        
    }
}

/* import Testing
 @testable import Friends

 @Suite
 struct FriendsTests {
     @Test("Name must not be empty or whitespace")
     func testNameValidation() {
         #expect(!TravelGoal.isValidName(""))
         #expect(!TravelGoal.isValidName("  "))
         #expect(TravelGoal.isValidName("Cupertino"))
     }
 }*/
