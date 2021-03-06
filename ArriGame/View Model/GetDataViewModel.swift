//
//  GetDataViewModel.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 11/09/21.
//

import Foundation
import SwiftyJSON

class GetDataViewModel: ObservableObject {
    @Published var datas = [DataTypeGeneral]()
    
    init() {
        let source = "https://api.rawg.io/api/games?key=767aa98cfa794da1a6fbcfd5468a3492"
        let url = URL(string: source.replacingOccurrences(of: " ", with: "%20"))!
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {(data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            if let json = try? JSON(data: data!) {
                for result in json["results"] {
                    let id = result.1["id"].rawValue
                    let slug = result.1["slug"].stringValue
                    let name = result.1["name"].stringValue
                    let released = result.1["released"].stringValue
                    let background_image = result.1["background_image"].stringValue
                    let rating = result.1["rating"].stringValue
                    
                    DispatchQueue.main.async {
                        self.datas.append(DataTypeGeneral(id: id as! Int, slug: slug, name: name, released: released, background_image: background_image, rating: rating))
                    }
                }
            }
        }.resume()
    }
}
