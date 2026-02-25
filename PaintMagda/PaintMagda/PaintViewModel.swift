//
//  PaintViewModel.swift
//  PaintMagda
//
//  Created by Magda on 24/02/26.
//

import Foundation
import Observation

@MainActor
@Observable

class PaintViewModel {
    var items: [Paint] = []
    var lastError: String?

    private let base = "https://collectionapi.metmuseum.org/public/collection/v1"

    func load(search term: String) async {
        items.removeAll()
        lastError = nil

        // 1)Buscar ID
        guard let autor = term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let searchURL = URL(string: "\(base)/search?hasImages=true&q=\(autor)")
        else { return }
      

        do {
            let (sData, sResp) = try await URLSession.shared.data(from: searchURL)
            guard (sResp as? HTTPURLResponse)?.statusCode == 200 else {
                lastError = "Búsqueda: HTTP error"
                return
            }
            let search = try JSONDecoder().decode(SearchResponse.self, from: sData)
            guard let ids = search.objectIDs, !ids.isEmpty else {
                lastError = "Sin resultados"
                return
            }

            // 2)Pedir detalles por ID
            let first = Array(ids.prefix(20))
            var fetched: [Paint] = []
            try await withThrowingTaskGroup(of: Paint?.self) { group in
                for id in first {
                    group.addTask { [base] in
                        guard let url = URL(string: "\(base)/objects/\(id)") else { return nil }
                        let (d, r) = try await URLSession.shared.data(from: url)
                        guard (r as? HTTPURLResponse)?.statusCode == 200 else { return nil }
                        let obj = try JSONDecoder().decode(Paint.self, from: d)
                        // Solo los que realmente traen imagen
                        if let small = obj.primaryImageSmall, !small.isEmpty { return obj }
                        return nil
                    }
                }
                for try await obj in group {
                    if let o = obj { fetched.append(o) }
                }
            }

            // 3)Se imprime en la vista
            self.items = fetched.sorted { $0.title < $1.title }

        } catch {
            lastError = error.localizedDescription
        }
    }
}
