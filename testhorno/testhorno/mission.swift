//
//  modelb.swift
//  testhorno
//
//  Created by Magda on 14/03/26.
//

import Foundation

struct Mission: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var location: String
    var expectedLabel: String
    var acceptedLabels: [String]
    var isCompleted: Bool
}
