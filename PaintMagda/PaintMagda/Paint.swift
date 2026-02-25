//
//  Paint.swift
//  PaintMagda
//
//  Created by Magda on 24/02/26.
//

import Foundation

struct Paint: Decodable, Identifiable {
    let id: Int
    let title: String
    let artist: String?
    let date: String?
    let primaryImageSmall: String?
    let primaryImage: String?

    enum CodingKeys: String, CodingKey {
        case id = "objectID"
        case title
        case artist = "artistDisplayName"
        case date = "objectDate"
        case primaryImageSmall
        case primaryImage
    }
}
//endpoint
struct SearchResponse: Decodable {
    let total: Int
    let objectIDs: [Int]?
}
