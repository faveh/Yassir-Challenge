//
//  MoviesModel.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation

enum ListMovies {
    enum FetchMovies {
        struct Request {
            var page: Int
        }
        
        struct Response {
            var movies: [Movie]
        }
        
        struct ViewModel {
            struct DisplayedMovie {
                var title: String
                var posterURL: String
                var year: String
                var overview: String
            }
            var displayedMovies: [DisplayedMovie]
        }
    }
}
