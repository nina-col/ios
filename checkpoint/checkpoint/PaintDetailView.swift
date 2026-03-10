//
//  PaintDetailView.swift
//  checkpoint
//
//  Created by Magda on 02/03/26.
//

import SwiftUI

struct PaintDetailView: View {
    let paint: Paint
    var body: some View {
        VStack{
            Image(paint.imageName)
                .resizable()
                .scaledToFit( )
                .frame(width:300)
                
            
        }
    }
}


#Preview {
    PaintRow(paint:Paint(artist: "Vincent van Gogh",
             title: "The Bedroom",
                         description: "Vincent van Gogh so highly esteemed his bedroom painting that he made three distinct versions: the first, now in the collection of the Van Gogh Museum, Amsterdam; the second, belonging to the Art Institute of Chicago, painted a year later on the same scale and almost identical; and a third, smaller canvas in the collection of the Musée d’Orsay, Paris, which he made as a gift for his mother and sister. Van Gogh conceived the first Bedroom in October 1888, a month after he moved into his “Yellow House” in Arles, France. This moment marked the first time the artist had a home of his own, and he had immediately and enthusiastically set about decorating, painting a suite of canvases to fill the walls. Completely exhausted from the effort, he spent two-and-a-half days in bed and was then inspired to create a painting of his bedroom. As he wrote to his brother Theo, “It amused me enormously doing this bare interior. With a simplicity à la Seurat. In ﬂat tints, but coarsely brushed in full impasto, the walls pale lilac, the ﬂoor in a broken and faded red, the chairs and the bed chrome yellow, the pillows and the sheet very pale lemon green, the bedspread blood-red, the dressing-table orange, the washbasin blue, the window green. I had wished to express utter repose with all these very different tones.” Although the picture symbolized relaxation and peace to the artist, to our eyes the canvas seems to teem with nervous energy, instability, and turmoil, an effect heightened by the sharply receding perspective.", id: 1, imageName: "The_Bedroom"))
}

