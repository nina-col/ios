//
//  Photo.swift
//  FotoNasa
//
//  Created by Magda on 19/02/26.
//



import Foundation
struct Photo: Decodable, Identifiable{
    var id = UUID()
    var title: String
    var explanation: String
    var url: String?
    
    enum CodingKeys : String, CodingKey {
        case title, explanation, url
    }
}
