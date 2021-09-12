//
//  DataTypeSearch.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 12/09/21.
//

import Foundation

struct DataTypeSearch {

    var textSearch = String()
}

struct SearchResult: Hashable {
    
    var slug: String
    var name: String
    var released: String
    var background_image: String
    var rating: String
}
