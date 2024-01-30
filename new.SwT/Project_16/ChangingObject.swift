//
//  ChangingObject.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/4/24.
//

import SwiftUI

@MainActor class DelayedUpdater : ObservableObject {
//    @Published var value = 0
    var value = 10 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1

            }
        }

//        if self.value == 10 {
//            for i in 10...1 {
//                DispatchQueue.main.asyncAfter(deadline: .now() - Double(i)) {
//                    self.value -= 1
//                }
//            }
//
//        }
    }
}

struct ChangingObject: View {
    @StateObject private var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

struct ChangingObject_Previews: PreviewProvider {
    static var previews: some View {
        ChangingObject()
    }
}
