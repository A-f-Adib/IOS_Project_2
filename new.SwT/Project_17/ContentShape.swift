//
//  ContentShape.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/24/24.
//

import SwiftUI

struct ContentShape: View {
    var body: some View {
        VStack {
            Text("Content Shape begins here")
                Spacer()
                .frame(height : 200)
            Text("Content shape ends here")
        }
        //making the top element response
        .contentShape(Rectangle())
                .onTapGesture {
                    print("Vstack tapped!")
                }

        //top element refuse to response in zstack
//        .allowsHitTesting(false)
    }
}

struct ContentShape_Previews: PreviewProvider {
    static var previews: some View {
        ContentShape()
    }
}
