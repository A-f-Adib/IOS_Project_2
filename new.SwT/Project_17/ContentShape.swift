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
            Text("Hello")
                Spacer()
                .frame(height : 200)
            Text("World")
        }
        //making the top element response
        
        //top element refuse to response in zstack
        //.allowsHitTesting(false)
    }
}

struct ContentShape_Previews: PreviewProvider {
    static var previews: some View {
        ContentShape()
    }
}
