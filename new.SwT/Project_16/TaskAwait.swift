//
//  TaskAwait.swift
//  new.SwT
//
//  Created by A.f. Adib on 1/4/24.
//

import SwiftUI

struct TaskAwait: View {
    @State private var output = ""
    
    var body: some View {
       Text(output)
            .task {
                await fetchReadingsTwo()
            }
    }
    
    func fetchReadings() async {
        do {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let reading = try JSONDecoder().decode([Double].self, from: data)
            output = "Found \(reading.count) readings"
            
        } catch {
            print("error reading")
        }
    }
    
    
    //same func can be written with task..
    func fetchReadingsTwo() async {
        
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let reading = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(reading.count) readings"
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str) :
            output = str
        case .failure(let error) :
            output = "Download error"
        }
    }
    
    
}

struct TaskAwait_Previews: PreviewProvider {
    static var previews: some View {
        TaskAwait()
    }
}
