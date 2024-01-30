//
//  PriorityGesture.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/24/24.
//

import SwiftUI

struct PriorityGesture: View {
    var body: some View {
        VStack {
            
            //vstack tapped will print
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        print("Text Tapped")
                    }
            }.highPriorityGesture(
                TapGesture()
                    .onEnded({
                        print("Vstack tapped")
                    })
        )
            
            //both text will print
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        print("Text Tapped")
                    }
            }.simultaneousGesture(
                TapGesture()
                    .onEnded({
                        print("Vstack tapped")
                    })
        )
        }
    }
}

struct PriorityGesture_Previews: PreviewProvider {
    static var previews: some View {
        PriorityGesture()
    }
}
