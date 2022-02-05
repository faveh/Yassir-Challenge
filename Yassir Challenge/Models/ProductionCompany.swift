//
//  ProductionCompany.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation
import ObjectMapper

struct ProductionCompany: Mappable, Codable, Identifiable {
    var id: Int?
    var logo_path: String?
    var name: String?
    var origin_country: String?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        logo_path <- map["logo_path"]
        origin_country <- map["origin_country"]
    }
}
