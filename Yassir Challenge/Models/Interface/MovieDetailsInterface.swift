//
//  MovieDetailsInterface.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation

protocol MovieDetailsProtocol {
    func fetchMovieDetails(movieID: Int, completionHandler: @escaping (MovieDetails?, MovieDetailsError?) -> Void)
}

enum MovieDetailsError: Equatable, Error {
    case FetchError(String)
}
