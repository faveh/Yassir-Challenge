//
//  Movie.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation
import ObjectMapper

struct Movie: Mappable, Codable, Identifiable {
    var id: Int?
    var title: String?
    var overview: String?
    var original_title: String?
    var original_language: String?
    var backdrop_path: String?
    var poster_path: String?
    var release_date: String?
    var popularity: Double?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    var adult: Bool?
    var genre_ids: [Int]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        original_title <- map["original_title"]
        original_language <- map["original_language"]
        backdrop_path <- map["backdrop_path"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        popularity <- map["popularity"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
        adult <- map["adult"]
        genre_ids <- map["genre_ids"]
    }
}
