//
//  SpeechViewModel.swift
//  Speechly
//
//  Created by Magda on 19/02/26.
//

import SwiftUI

class SpeechViewModel: ObservableObject {
    
    @Published var arrSpeeches: [Speech] = []
    
    init() {
        loadSpeeches()
    }
    
    private func loadSpeeches() {
        
        var speech = Speech(
            name: "IllusionOfChoice",
            title: "The illusion of choice",
            description: "A short speech about how more options can sometimes reduce freedom and increase anxiety.",
            videoURL: "https://www.youtube.com/watch?v=sO7U78pUr34",
            imageName: ["ChichenItza", "ChichenItza2", "ChichenItza3"]
        )
        arrSpeeches.append(speech)
        
        speech = Speech(
            name: "Discipline",
            title: "Discipline beats motivation",
            description: "A speech about building systems that work even when motivation disappears.",
            videoURL: "https://www.youtube.com/watch?v=Vu8kO9qxG4o",
            imageName: ["TajMahal", "TajMahal2", "TajMahal3"]
        )
        arrSpeeches.append(speech)
        
        speech = Speech(
            name: "Focus",
            title: "One thing at a time",
            description: "A speech about attention, deep work, and why multitasking is a trap.",
            videoURL: "https://www.youtube.com/watch?v=pJOwI-74xwY",
            imageName: ["Colosseum", "Colosseum2", "Colosseum3"]
        )
        arrSpeeches.append(speech)
    }
}
