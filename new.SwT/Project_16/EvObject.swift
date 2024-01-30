//
//  EvObject.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/4/24.
//

import SwiftUI

@MainActor class UserClass : ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView : View {
    
    @EnvironmentObject var user : UserClass
    
    var body: some View {
        
        TextField("Name", text: $user.name)
    }
}


struct DisplayView : View {
    
    @EnvironmentObject var user : UserClass
    
    var body : some View {
        Text(user.name)
    }
}

struct EvObject: View {
    
    @StateObject var user = UserClass()
    
    var body: some View {
        VStack{
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct EvObject_Previews: PreviewProvider {
    static var previews: some View {
        EvObject()
    }
}
