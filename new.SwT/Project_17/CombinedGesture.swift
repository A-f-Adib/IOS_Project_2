//
//  CombinedGesture.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/24/24.
//

import SwiftUI

struct CombinedGesture: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width : 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct CombinedGesture_Previews: PreviewProvider {
    static var previews: some View {
        CombinedGesture()
    }
}
