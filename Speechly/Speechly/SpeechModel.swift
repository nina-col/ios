//
//  SpeechModel.swift
//  Speechly
//
//  Created by Magda on 19/02/26.
//

import Foundation

struct Speech: Identifiable, Decodable {
    
    var id = UUID()
    var name: String
    var title: String
    var description: String
    var imageName: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case title
        case description
        case imageName
    }
}
