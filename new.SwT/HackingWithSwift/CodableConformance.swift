//
//  CodableConformance.swift
//  new.SwT
//
//  Created by A.f. Adib on 11/21/23.
//

import SwiftUI

class User : ObservableObject, Codable {
    var name = "Taylor"
}

struct CodableConformance: View {
    var body: some View {
       Button("Encode", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

struct CodableConformance_Previews: PreviewProvider {
    static var previews: some View {
        CodableConformance()
    }
}
