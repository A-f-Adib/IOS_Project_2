//
//  BreakingBadJson.swift
//  new.SwT
//
//  Created by A.f. Adib on 12/7/23.
//

import SwiftUI

struct Quote : Codable {
    var quote_id : Int
    var quote : String
    var author : String
    var series : String
}

struct BreakingBadJson: View {
    
    @State private var quotes = [Quote]()
    
    var body: some View {
        NavigationView {
            List(quotes, id: \.quote_id) { data in
                VStack(alignment : .leading) {
                    Text(data.author)
                        .font(.headline)
                    Text(data.quote)
                        .font(.body)
                }
            }
            .navigationTitle("Breaking Bad Quotes")
            .task {
                await fetchData()
            }
        }
    }
    
    
    func fetchData () async {
        
        //create the url
        guard let url = URL(string: "https://wwww.breakingbadapi.com/api/quotes") else {
            print("invalid url")
            return
        }
        
        //fetch the data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode the data
            if let decodedData = try? JSONDecoder().decode([Quote].self, from: data) {
                quotes = decodedData
                
            }
        } catch {
            print("Failed to Decode")
        }
    
    }
}

struct BreakingBadJson_Previews: PreviewProvider {
    static var previews: some View {
        BreakingBadJson()
    }
}
