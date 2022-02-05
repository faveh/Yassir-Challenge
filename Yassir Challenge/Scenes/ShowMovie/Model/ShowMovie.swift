//
//  ShowMovie.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 04/02/2022.
//

import Foundation

enum ShowMovie {
    enum FetchMovie {
        struct Request {
            var movieID: Int
        }
        
        struct Response {
            var movie: MovieDetails
        }
        
        struct ViewModel {
            struct DisplayedMovie {
                var tagline: String
                var title: String
                var overview: String
                var genres: [String]
                var language: [String]
                var rating: Double
                var length: String
                var releaseDate: String
                var posterURL: String
                var backDropURL: String
            }
            
            var displayedMovie: DisplayedMovie
        }
    }
}
