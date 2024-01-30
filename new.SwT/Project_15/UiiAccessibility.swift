//
//  UiiAccessibility.swift
//  new.SwT
//
//  Created by A.f. Adib on 12/29/23.
//

import SwiftUI

struct UiiAccessibility: View {
    var body: some View {
//        Decorative : this image is here just to look better
//        accessiblityHidden : makes the view hidden for voice over
//        acce..ele..combine : real all text at flow
//        acce..ele..ignore : ignore all the text
        
        VStack {
            Image(decorative: "galina-n-189483")
                .accessibilityHidden(true)
            Text("Your score is")
            Text("1000")
                .font(.title)
            
        }
//        .accessibilityElement(children: .combine)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        
    }
}

struct UiiAccessibility_Previews: PreviewProvider {
    static var previews: some View {
        UiiAccessibility()
    }
}
