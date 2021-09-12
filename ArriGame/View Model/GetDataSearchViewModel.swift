//
//  GetDataSearchViewModel.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 12/09/21.
//

import Foundation
import SwiftyJSON

class GetDataSearchViewModel: ObservableObject {
    @Published var searchResult = [SearchResult]()
    @Published var dataTypeSearch = DataTypeSearch()
    
    var searchText: String {
        get {
            dataTypeSearch.textSearch
        }
        
        set {
            dataTypeSearch.textSearch = newValue
        }
    }
    
    func addData() {
        let source = "https://api.rawg.io/api/games?search=\(searchText.replacingOccurrences(of: " ", with: "%20"))&key=767aa98cfa794da1a6fbcfd5468a3492"
        print(source)
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {(data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            if let json = try? JSON(data: data!) {
                for result in json["results"] {
                    let slug = result.1["slug"].stringValue
                    let name = result.1["name"].stringValue
                    let released = result.1["released"].stringValue
                    let background_image = result.1["background_image"].stringValue
                    let rating = result.1["rating"].stringValue
                    
                    DispatchQueue.main.async {
                        self.searchResult.append(SearchResult(slug: slug, name: name, released: released, background_image: background_image, rating: rating))
                    }
                }
            }
        }.resume()
    }
}
