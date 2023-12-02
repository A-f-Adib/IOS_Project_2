//
//  CodableData.swift
//  new.SwT
//
//  Created by A.f. Adib on 11/20/23.
//

import SwiftUI

struct Response : Codable {
    var results : [Result]
}

struct Result: Codable {
    var trackId : Int
    var tarckName : String
    var collectionName: String
}


struct CodableData: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        
        List(results, id : \.trackId) { data in
            VStack(alignment: .leading) {
                Text(data.tarckName)
                    .font(.headline)
                
                Text(data.collectionName)
                    .font(.subheadline)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
     
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                
                results = decodedResponse.results
            }
            
        } catch {
            print("Invalid Data")
        }
    }
}

struct CodableData_Previews: PreviewProvider {
    static var previews: some View {
        CodableData()
    }
}
