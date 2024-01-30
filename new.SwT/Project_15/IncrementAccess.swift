//
//  IncrementAccess.swift
//  new.SwT
//
//  Created by A.f. Adib on 12/29/23.
//

import SwiftUI

struct IncrementAccess: View {
    
    @State private var value = 10
   
    
    var body: some View {
        VStack {
            Text("Value : \(value)")
            
            Button("Increment") {
                value += 1
            }.padding()
            Button("Decrement") {
                value -= 1
            }.disabled(value == 1)
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment :
                value += 1
            case .decrement :
                value -= 1
            default :
                print("No result found")
            }
        }
        
    }
}

struct IncrementAccess_Previews: PreviewProvider {
    static var previews: some View {
        IncrementAccess()
    }
}
