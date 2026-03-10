//
//  Player.swift
//  swiftData
//
//  Created by Magda on 05/03/26.
//

import Foundation


struct Player: Identifiable {
    let id = UUID()


    var name: String
    var score: Int
}
