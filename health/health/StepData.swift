//
//  StepData.swift
//  health
//
//  Created by Magda on 09/03/26.
//

import Foundation

enum ActivityTrend {
    case increasing
    case decreasing
    case stable
}

struct StepData {
    var stepsToday: Int
    var weeklySteps: [Int]
    var weeklyAverage: Int
    var leastActiveDay: String
    var trend: ActivityTrend
}
