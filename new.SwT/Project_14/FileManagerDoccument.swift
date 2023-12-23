//
//  FileManager.swift
//  new.SwT
//
//  Created by A.f. Adib on 12/24/23.
//

import SwiftUI

struct FileManagerDoccument: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                let str = "Text Message"
                let url = getDoccumentsDirectory().appendingPathComponent("message.txt")
                
                do{
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDoccumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct FileManagerDoccument_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerDoccument()
    }
}
