//
//  BioMetricUnlock.swift
//  new.SwT
//
//  Created by A.f. Adib on 12/24/23.
//
import LocalAuthentication
import SwiftUI

struct BioMetricUnlock: View {
    
    @State private var isUnlocked = false
    
    var body: some View {
        
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text ("Locked")
            }
        }
        .onAppear(perform: auhenticate)
    }
    
    
    func auhenticate () {
        let context = LAContext()
        var error : NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "we need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    // authenticaed successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct BioMetricUnlock_Previews: PreviewProvider {
    static var previews: some View {
        BioMetricUnlock()
    }
}
