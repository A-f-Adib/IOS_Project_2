//
//  OnBoardingView.swift
//  new.SwT
//
//  Created by A.f. Adib on 9/20/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    let Transition : AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .top))
        
    
    @State var onBordingState : Int = 0
    @State var name : String = ""
    @State var age : Double = 24
    @State var gender : String = ""
    let ChooseGender : [String] = ["male", "felame"]
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    //appStorage
    @AppStorage("name") var currentUserName : String?
    @AppStorage("age") var currentUserAge : Int?
    @AppStorage("gender") var currentUSerGender : String?
    @AppStorage("Signed_in") var UserSignIn : Bool = false
    
    var body: some View {
        ZStack{
           
            
            switch onBordingState {
            case 0 :
                welcomeSection
                    .transition(Transition)
            case 1 :
                addNameSection
                    .transition(Transition)
            case 2:
                addAge
                    .transition(Transition)
            case 3 :
                addGender
                    .transition(Transition)
            default :
                
                RoundedRectangle(cornerRadius: 10)
            }
            VStack{
                 Spacer()
                bottomBotton
            }
            .padding(20)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(.cyan)
    }
}


//MARK: Components

extension OnBoardingView {
    
    private var bottomBotton : some View {
        Text(onBordingState == 0 ? "Sign up" :
                onBordingState == 3 ? "Finish" : "Next")
            .font(.headline)
            .foregroundColor(.cyan)
            .frame(height: 55 )
            .frame(maxWidth: .infinity )
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                ButtonPress()
            }
    }
    
    private var welcomeSection : some View {
        VStack{
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(Color.white)
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text("This is the no 1 dating site.")
                .foregroundColor(.white)
                
            Spacer()
            Spacer()
        }
    }
    
    private var addNameSection : some View{
        VStack{
            Spacer()
            Text("What is your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Type your name here..", text: $name)
                .frame(width : .infinity, height:50 )
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
                .padding()
                
            
            Spacer()
            Spacer()
        }
    }
    
    private var addAge : some View {
        VStack{
            Spacer()
            Text("What is your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
       
            Text("\(String(format: "%.0f", age))")
                .foregroundColor(.white)
                .padding(.top,10)
                .font(.title)
           Slider(value: $age,
                  in: 18...100,
                  step: 1)
            
            Spacer()
            Spacer()
        }
        
    }
    
    private var addGender : some View{
        VStack{
            Spacer()
            Text("What is your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Picker("Select gender", selection: $gender) {
                ForEach(ChooseGender, id: \.self) { data in        Text("Choose :  \(data)")
                     
                }
            } .accentColor(.white)
                .font(.title3)
            .padding()
           
            .background(Color.blue)
            .cornerRadius(10)
        
            Spacer()
            Spacer()
        }
    }
   
}

// MARK: FUNCTIONS
extension OnBoardingView{
    
    func ButtonPress() {
        
        
        //check inputs
        switch onBordingState{
       
        case 1:
            guard name.count >= 3 else {
                alertFunc(title: "Your name must be atleast 3 characters")
                
                return
            }
            
        case 3 :
            guard gender.count >= 1 else {
                alertFunc(title: "You must select your gender")
                
            return
            }
        default:
            break
        }
        
        
        //next state
        if onBordingState == 3 {
            SignedIn()
           
        }
        else{
            withAnimation(.spring()){
                onBordingState += 1
            }
        }
    }
    
    func alertFunc (title : String){
        alertTitle = title
        showAlert.toggle()
    }
    
    func SignedIn(){
        currentUserName = name
        currentUserAge = Int(age)
        currentUSerGender = gender
        
        withAnimation(.spring()){
            UserSignIn = true
        }
       
    }
}
