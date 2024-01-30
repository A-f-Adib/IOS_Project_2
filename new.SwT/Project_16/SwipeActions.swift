//
//  SwipeActions.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/4/24.
//

import SwiftUI

struct SwipeActions: View {
    var body: some View {
        NavigationView {
            List
            {
                Text("Taylor Swift")
                    .swipeActions {
                        Button {
                            print("Message sent")
                        } label : {
                            Label("Send message", systemImage: "message")
                        }
                    }
                
                Text("Hacking with Swift")
                    .swipeActions {
                        Button(role : .destructive) {
                            print("Deleted")
                        } label: {
                            Label("Delete", systemImage: "minus.circle")
                        }
                    }
                
                    .swipeActions(edge : .trailing) {
                        Button {
                            print("Pinned")
                        } label : {
                            Label("Pin", systemImage: "pin")
                        }
                    }
                
                    .swipeActions(edge : .leading) {
                        Button {
                            print("Pinned")
                        } label : {
                            Label("Pin", systemImage: "pin")
                        }
                        .tint(.orange)
                    }
        }
            .navigationTitle("Swipe Actions")
        }
    }
}

struct SwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActions()
    }
}
