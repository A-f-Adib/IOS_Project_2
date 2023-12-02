//
//  HapticEffects.swift
//  new.SwT
//
//  Created by A.f. Adib on 11/21/23.
//
import CoreHaptics
import SwiftUI

struct HapticEffects: View {
    @State private var counter = 0
    @State private var engine : CHHapticEngine?
    
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error creating engine \(error.localizedDescription)")
        }
    }
}

struct HapticEffects_Previews: PreviewProvider {
    static var previews: some View {
        HapticEffects()
    }
}
