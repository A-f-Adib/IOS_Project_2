//
//  IntroView.swift
//  new.SwT
//
//  Created by A.f. Adib on 9/20/23.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("Signed_in") var UserSignedIn : Bool = false
    var body: some View {
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                center: .topLeading,
                startRadius: 5,
                endRadius: 700)
                .ignoresSafeArea()
            
            if UserSignedIn {
                ProfileView()
            }
            else{
                OnBoardingView()
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
