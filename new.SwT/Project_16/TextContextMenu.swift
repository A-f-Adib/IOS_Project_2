//
//  TextContextMenu.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/4/24.
//

import SwiftUI
import UserNotifications

struct TextContextMenu: View {
    
    @State private var background = Color.blue
    
    var body: some View {
        VStack {
            Text("Taylor swift")
                .padding()
                .background(background)
            
            Text("Change the Color of the text")
                .padding()
                .contextMenu {
                    Button(role : .destructive) {
                        background = .red
                    } label: {
                       Label("Red", systemImage: "checkmark.circle.fill")
                            
                    }
                    
                    Button(role : .cancel) {
                        background = .blue
                    } label: {
                       Label("Blue", systemImage: "checkmark.circle.fill")
                           
                    }
                    
                    Button(role : .none) {
                        background = .green
                    } label: {
                       Label("Green", systemImage: "checkmark.circle.fill")
                    }

                }
        }
    }
}

struct TextContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        TextContextMenu()
    }
}
