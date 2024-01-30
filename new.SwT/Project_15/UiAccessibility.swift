//
//  UiAccessibility.swift
//  new.SwT
//
//  Created by A.f. Adib on 12/29/23.
//

import SwiftUI

struct UiAccessibility: View {
    let pictures = [
      "ales-krivec-15949",
      "galina-n-189483",
      "kevin-horstmann-141705",
      "nicolas-tissot-335096"
    ]
    
    let labels = [
       "Tulips",
       "Frozen tree buds",
       "Sunflowers",
       "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    
    var body: some View {
        VStack {
           
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    selectedPicture = Int.random(in: 0...3)
                }
                .accessibilityLabel(labels[selectedPicture])
                .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
        }
    }
}

struct UiAccessibility_Previews: PreviewProvider {
    static var previews: some View {
        UiAccessibility()
    }
}
