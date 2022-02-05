//
//  WorkerConstants.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation

enum WorkerConstants {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let moviesPage = "discover/movie/"
    static let movieDetails = "movie/"
    static let apiKey = "?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3"
    
    // Params
    static let language = "&language=en-US"
    static let sort_by = "&sort_by=popularity.desc"
    static let include_adult = "&include_adult=false"
    static let include_video = "&include_video=false"
    static let page = "&page="
    
    // Error Messages
    static let errorFetchingMoviesPage = "Unable to fetch Movies Page"
    static let errorFetchingMovieDetails = "Unable to fetch Movie Details"
}
