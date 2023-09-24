//
//  ProfileView.swift
//  new.SwT
//
//  Created by A.f. Adib on 9/21/23.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") var currentUserName : String?
    @AppStorage("age") var currentUserAge : Int?
    @AppStorage("gender") var currentUSerGender : String?
    @AppStorage("Signed_in") var UserSignIn : Bool = false
    
    
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUserName ?? "User name")
            Text("User age \(currentUserAge ?? 0)")
            Text("User is \(currentUSerGender ?? "unknown")")
            
            Spacer()
            Text("Sign out")
                .font(.title)
                .foregroundColor(.black)
                .frame(height: 55 )
                .frame(maxWidth: .infinity )
                .background(Color.brown)
                .cornerRadius(10)
                .onTapGesture {
                   SignOut()
                }
        }.padding(50)
        
        .font(.title)
        
        .background(Color.black)
        .cornerRadius(15)
        .shadow(color:.blue, radius: 50)
        .foregroundColor(.brown)
        
    }
    
    func SignOut () {
        currentUserName = nil
        currentUserAge = nil
        currentUSerGender = nil
        withAnimation(.spring()){
            UserSignIn = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
