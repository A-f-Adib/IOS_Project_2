//
//  PackageDownload.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/6/24.
//

import SwiftUI
import SamplePackage

struct PackageDownload: View {
    let possibleNum = Array(1...60)
    
    var body: some View {
       Text(results)
    }
    
    var results : String {
        let selected = possibleNum.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
}

struct PackageDownload_Previews: PreviewProvider {
    static var previews: some View {
        PackageDownload()
    }
}
