//
//  Friend.swift
//  modelPer
//
//  Created by Magda on 05/03/26.
//

import Foundation
import SwiftData

@Model

class Friend {
    
    var name: String
    var birthday: Date //me salia error con int y lo cambie a date a ver si jalaba y si
    
    
    init(name: String, birthday: Date) {
            self.name = name
            self.birthday = birthday
        }
    
    var isBirthdayToday: Bool {
           Calendar.current.isDateInToday(birthday)
       }
}
