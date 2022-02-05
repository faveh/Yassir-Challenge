//
//  MoviesPage.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation
import ObjectMapper

struct MoviesPage: Mappable, Codable {
    var page: Int?
    var results: [Movie]?
    var total_pages: Int?
    var total_results: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        page <- map["page"]
        results <- map["results"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
    }
    
    
}
