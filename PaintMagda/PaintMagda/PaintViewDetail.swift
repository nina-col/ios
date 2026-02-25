//
//  PaintViewDetail.swift
//  PaintMagda
//
//  Created by Magda on 24/02/26.
//

import SwiftUI

struct PaintViewDetail: View {
    let paint: Paint

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                if let s = paint.primaryImage ?? paint.primaryImageSmall,
                   let u = URL(string: s) {
                    AsyncImage(url: u) { img in
                        img.resizable().scaledToFit()
                    } placeholder: { ProgressView() }
        
                }

                Text(paint.title).font(.title2).bold()

                if let a = paint.artist, !a.isEmpty {
                    Text(a).font(.headline)
                }
                if let d = paint.date, !d.isEmpty {
                    Text(d).foregroundStyle(.secondary)
                }
                if let d = paint.medium, !d.isEmpty {
                    Text(d).foregroundStyle(.secondary)
                }
            }
            .padding()
        }
        .navigationTitle("More info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PaintViewDetail(paint: Paint(
        id: 1,
        title: "Título ejemplo",
        artist: "Autor ejemplo",
        date: "1890",
        primaryImageSmall: "https://images.metmuseum.org/CRDImages/ep/web-large/DT1234.jpg",
        primaryImage: nil,
        medium: nil
    ))
}
