//
//  TravelGoal.swift
//  Friends
//
//  Created by Magda on 09/03/26.
//

import Foundation
import SwiftData

@Model
class TravelGoal{
    var name : String
    var dateAdded : Date
    var visited : Bool
    var notes: String
    
    init(name: String, dateAdded: Date, visited: Bool, notes: String){
        self.name = name
        self.dateAdded = dateAdded
        self.visited = visited
        self.notes = notes
    }
    static func isValidName(_ name: String ) -> Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty}
    static func dateAdded(_ date: Date ) -> Bool {date >= Date()
    }
}
