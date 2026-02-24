//
//  Place.swift
//  Places
//
//  Created by Magda on 16/02/26.
//este es el model
import Foundation

struct Place : Identifiable, Decodable {
    var id = UUID()
    var name : String
    var title: String
    var description: String
    var videoURL : String
    var imageName : [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case title
        case description
        case videoURL

