//
//  SwiftUIView.swift
//  FotoNasa
//
//  Created by Magda on 19/02/26.
//

import SwiftUI

struct PhotoListView: View {
    @State var photoVM = PhotoViewModel()
    var body: some View {
        VStack{
            List{
                ForEach(photoVM.arrPhotos) {
                    photo in Text(photo.title)
                    AsyncImage(url: URL(string: photo.url ?? "http://"))
                        .scaledToFit()
                        .frame(height: 100)
                }
            }
            .task{
                do{
                    try await photoVM.getPhotosNasa()
                }
                catch{
                    print("error")
                }
            }
            
        }
    }
}

#Preview {
    PhotoListView()
}
