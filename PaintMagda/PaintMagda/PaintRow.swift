//
//  PaintRow.swift
//  PaintMagda
//
//  Created by Magda on 24/02/26.
//

import SwiftUI

struct PaintRow: View {
    let paint: Paint

    var body: some View {
        HStack(spacing: 12) {
            if let s = paint.primaryImageSmall, let u = URL(string: s) {
                AsyncImage(url: u) { img in
                    img.resizable().scaledToFill()
                } placeholder: { ProgressView() }
                .frame(width: 100, height: 80)
                .clipped()
                
               
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(paint.title).font(.headline).lineLimit(2)
                if let a = paint.artist, !a.isEmpty {
                    Text(a).font(.subheadline).foregroundStyle(.secondary)
                }
                
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    PaintRow(paint: Paint(
        id: 1,
        title: "Cosa",
        artist: "AutorRandom",
        date: "c. 1890",
        primaryImageSmall: "https://www.metmuseum.org/art/collection/search/436532",
        primaryImage: nil,
        medium: nil
    ))
}
