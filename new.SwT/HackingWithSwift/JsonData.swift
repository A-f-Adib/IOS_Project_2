//
//  CodableData.swift
//  SwiftfulThinking
//
//  Created by A.f. Adib on 11/10/23.
//

import SwiftUI

struct user : Codable {
    let name : String
    let address : Address
}

struct Address : Codable {
    let City : String
    let Country : String
}

struct JsonData: View {
    
    @State var text = ""
    @State var addr = ""
    
    var body: some View {
        VStack {
            Button("Decode json") {
                newdecode()
                
            }
            
            Text(text)
                .padding(.top)
            Text(addr)
            
        }
    }
    
    func newdecode() {
        
        let input = """
            {
              "name" : "Taylor swift",
              "address" : {
                        "City" : "111, New York ",
                        "Country" : "USA"
               }
            }
            """
        let data = Data(input.utf8)
        let decoder = JSONDecoder()
        
        if let User = try? decoder.decode(user.self, from: data) {
                print(User.address.City)
//            Text("\(User.address.City)")
            text = User.name
            addr = User.address.City
        }
    }
}

struct JsonData_Previews: PreviewProvider {
    static var previews: some View {
        JsonData()
    }
}

