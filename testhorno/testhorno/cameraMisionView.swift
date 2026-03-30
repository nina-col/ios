//
//  Camreaiewmision.swift
//  testhorno
//
//  Created by Magda on 14/03/26.
//

import SwiftUI
import UIKit

struct CameraMissionView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: MissionViewModel
    
    let mission: Mission
    
    @State private var showCamera = false
    @State private var capturedImage: UIImage?
    
    @State private var isProcessing = false
    @State private var detectedLabel = ""
    @State private var confidenceText = ""
    @State private var resultMessage = "Toma una foto del objeto de la misión"
    @State private var didFindObject = false
    @State private var classificationError = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.gray.opacity(0.75),
                    Color.gray.opacity(0.55),
                    Color.black.opacity(0.85)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.7), lineWidth: 5)
                        .frame(width: 290, height: 390)
                    
                    if let capturedImage {
                        Image(uiImage: capturedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 280, height: 380)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } else {
                        Circle()
                            .stroke(Color.white.opacity(0.9), lineWidth: 3)
                            .frame(width: 18, height: 18)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(Color.orange.opacity(0.18))
                                .frame(width: 48, height: 48)
                            
                            Image(systemName: didFindObject ? "checkmark.seal.fill" : "camera")
                                .foregroundStyle(didFindObject ? .green : .orange)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(didFindObject ? "✓ Misión completada" : mission.title)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Text(resultMessage)
                                .font(.system(size: 14))
                                .foregroundStyle(.white.opacity(0.82))
                        }
                        
                        Spacer()
                    }
                    
                    if !detectedLabel.isEmpty {
                        Text("Detectado: \(detectedLabel)")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    
                    if !confidenceText.isEmpty {
                        Text("Confianza: \(confidenceText)")
                            .font(.system(size: 13))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    
                    if !classificationError.isEmpty {
                        Text(classificationError)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundStyle(.red)
                    }
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: didFindObject ? [.green, .green.opacity(0.7)] : [.orange, .yellow],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(height: 10)
                        .padding(.top, 8)
                    
                    Button {
                        showCamera = true
                    } label: {
                        HStack {
                            Spacer()
                            Text(isProcessing ? "Analizando..." : "Tomar foto")
                                .font(.system(size: 16, weight: .bold))
                            Spacer()
                        }
                        .padding(.vertical, 14)
                        .background(Color.white.opacity(0.16))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    .disabled(isProcessing)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                }
                .padding(26)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal, 20)
                .padding(.bottom, 28)
            }
        }
        .navigationTitle("Cámara")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showCamera) {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                ImagePicker(sourceType: .camera) { image in
                    capturedImage = image
                    classifyCapturedImage(image)
                }
            } else {
                Text("La cámara no está disponible en este dispositivo.")
                    .padding()
            }
        }
    }
    
    private func classifyCapturedImage(_ image: UIImage) {
        isProcessing = true
        classificationError = ""
        resultMessage = "Analizando imagen..."
        detectedLabel = ""
        confidenceText = ""
        
        ImageClassifierService.shared.classify(image: image) { result in
            DispatchQueue.main.async {
                isProcessing = false
                
                switch result {
                case .success(let output):
                    detectedLabel = output.label
                    confidenceText = String(format: "%.0f%%", output.confidence * 100)
                    
                    if viewModel.matchesMission(mission, detectedLabel: output.label, confidence: output.confidence) {
                        didFindObject = true
                        resultMessage = "El objeto coincide con la misión"
                        viewModel.completeMission(id: mission.id)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            dismiss()
                        }
                    } else {
                        didFindObject = false
                        resultMessage = "No coincide con el objeto esperado"
                    }
                    
                case .failure(let error):
                    didFindObject = false
                    classificationError = error.localizedDescription
                    resultMessage = "No se pudo clasificar la imagen"
                }
            }
        }
    }
}
