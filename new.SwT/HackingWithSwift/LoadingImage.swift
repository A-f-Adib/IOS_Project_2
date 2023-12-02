//
//  LoadingImage.swift
//  new.SwT
//
//  Created by A.f. Adib on 11/21/23.
//

import SwiftUI

struct LoadingImage: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("error loading image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct LoadingImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingImage()
    }
}
