//
//  AppStorageView.swift
//  SwiftfulThinking
//
//  Created by A.f. Adib on 9/11/23.
//

import SwiftUI

struct AppStorageView: View {
    
    @AppStorage("Name") var UserName : String?
    
    var body: some View {
        VStack(spacing:30){
            Text(UserName ?? "Add name")
            if let name = UserName{
                Text(name)
                    .textSelection(.enabled)
            }
            
            Button("save") {
                let name = "emilyyyyyyyh"
                UserName = name
               
            }
    
        }
     
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}

