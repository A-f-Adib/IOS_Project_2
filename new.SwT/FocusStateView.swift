//
//  FocusStateView.swift
//  SwiftfulThinking
//
//  Created by A.f. Adib on 9/13/23.
//

import SwiftUI

struct FocusStateView: View {
    
    enum FocusItems : Hashable{
        case username
        case password
    }
    @State private var username : String = ""
    @State private var password : String = ""
    @FocusState private var fieldInFocus : FocusItems?
    
    @State var buttonChange : String = "Next"
   

    var body: some View {
        VStack{
            TextField("Add name..", text: $username)
              .focused($fieldInFocus, equals: .username)
              .submitLabel(.go)
              .padding()
            
            SecureField("Add password..", text: $password)
              .focused($fieldInFocus, equals: .password)
              .padding()
            
            Button(username.isEmpty ? "Type" : buttonChange) {
                let user = username.isEmpty
                let pass = password.isEmpty
                
               
                if user {
                    fieldInFocus = .username
                }
                else if pass {
                    fieldInFocus = .password
                }
                else if !user && !pass {
                    
                    buttonChange = "Save"
                    
                }
               
            }
           
                
        }
    }
}

struct FocusStateView_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateView()
    }
}

