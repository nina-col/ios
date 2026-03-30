//
//  imageClasifierServices.swift
//  testhorno
//
//  Created by Magda on 15/03/26.
//

import UIKit
import Vision
import CoreML

final class ImageClassifierService {
    
    static let shared = ImageClassifierService()
    
    private init() {}
    
    func classify(image: UIImage, completion: @escaping (Result<(label: String, confidence: Double), Error>) -> Void) {
        guard let ciImage = CIImage(image: image) else {
            completion(.failure(ClassifierError.invalidImage))
            return
        }
        
        do {
            let config = MLModelConfiguration()
            let coreMLModel = try ClasificadorHistoriabien(configuration: config)
            let visionModel = try VNCoreMLModel(for: coreMLModel.model)
            
            let request = VNCoreMLRequest(model: visionModel) { request, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let observations = request.results as? [VNClassificationObservation],
                      let topResult = observations.first else {
                    completion(.failure(ClassifierError.noResults))
                    return
                }
                
                completion(.success((
                    label: topResult.identifier,
                    confidence: Double(topResult.confidence)
                )))
            }
            
            request.imageCropAndScaleOption = .centerCrop
            
            let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
            
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    try handler.perform([request])
                } catch {
                    completion(.failure(error))
                }
            }
            
        } catch {
            completion(.failure(error))
        }
    }
}

enum ClassifierError: LocalizedError {
    case invalidImage
    case noResults
    
    var errorDescription: String? {
        switch self {
        case .invalidImage:
            return "No se pudo convertir la imagen."
        case .noResults:
            return "El modelo no devolvió resultados."
        }
    }
}
