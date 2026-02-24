//
//  PhotViewModel.swift
//  FotoNasa
//
//  Created by Magda on 19/02/26.
//

import Foundation
@MainActor
//main actor libra de los tgreads
@Observable
class PhotoViewModel {
    
    //crear objeto url
    var arrPhotos = [Photo]()
    
    func getPhotosNasa() async throws{
        guard let url = URL(string:
                                "https://api.nasa.gov/planetary/apod?api_key=bYey7S0sQkh0e3eYxqdSfGfUdQxnes5il2Gdwg3k&count=10")
                            else {
            print("invalid URL")
            return}
                            
                            
    //2 preparar request
        let urlRequest = URLRequest(url: url)
        //destructuring
        
        
        //si es asincronica necesita await y async y tambien necesita throws
        
        
        //3 realizar llamada
                            
        
        let(data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print ("Error")
            return
        }
        
        
        //decodificar
        
        let results = try JSONDecoder().decode([Photo].self, from: data)
        
        
        self.arrPhotos = results
        
   
        
    }
}
