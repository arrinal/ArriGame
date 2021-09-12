//
//  GetDataDetailViewModel.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 12/09/21.
//

import Foundation
import SwiftyJSON

class GetDataDetailViewModel: ObservableObject {
    @Published var datas = DataTypeDetail()
    
    func addData(slug: String) {
        let source = "https://api.rawg.io/api/games/\(slug)?key=767aa98cfa794da1a6fbcfd5468a3492"
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {(data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            if let json = try? JSON(data: data!) {
                let id = json["id"].rawValue
                let description_raw = json["description_raw"].stringValue
                let name = json["name"].stringValue
                let released = json["released"].stringValue
                let background_image = json["background_image"].stringValue
                let rating = json["rating"].stringValue
            
                DispatchQueue.main.async {
                    self.datas = DataTypeDetail(id: id as! Int, description_raw: description_raw, name: name, released: released, background_image: background_image, rating: rating)
                }
            }
        }.resume()
    }
}
