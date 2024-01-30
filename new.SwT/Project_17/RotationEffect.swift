//
//  RotationEffect.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/24/24.
//

import SwiftUI

struct RotationEffect: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotationGesture()
                    .onChanged({ angle in
                        currentAmount = angle
                    })
                    .onEnded({ angle in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    })
            )
    }
}

struct RotationEffect_Previews: PreviewProvider {
    static var previews: some View {
        RotationEffect()
    }
}
