//
//  SpeechViewModel.swift
//  Speechly
//
//  Created by Magda on 19/02/26.
//

import Foundation

@Observable
class SpeechViewModel {

    var arrSpeeches = [Speech]()

    init() {

        var speech = Speech(
            name: "Peliculas",
            title: "Peliculas",
            description: "discurso del las elecciones de peliculas",
            imageName: ["palomitas"]
        )
        arrSpeeches.append(speech)

        speech = Speech(
            name: "Pulpi",
            title: "Mascota del mundial",
            description: "presentar pulpi la nueva mascota",
            imageName: ["pulpofut"]
        )
        arrSpeeches.append(speech)

        speech = Speech(
            name: "Water",
            title: "Water",
            description: "A speech about drinking more water",
            imageName: ["tomar"]
        )
        arrSpeeches.append(speech)
    }
}
