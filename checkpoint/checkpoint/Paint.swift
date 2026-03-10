//
//  Paint.swift
//  checkpoint
//
//  Created by Magda on 02/03/26.
//

import Foundation


struct Paint: Identifiable, Decodable{
    var artist : String
    var title : String
    var description : String
    var id: Int
    var imageName : String
    
    enum CodingKeys: String, CodingKey {
        case artist
        case title
        case description
        case id
        case imageName
    }
}

