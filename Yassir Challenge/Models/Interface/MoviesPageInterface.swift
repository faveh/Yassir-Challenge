//
//  MoviesPageInterface.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation

protocol MoviesPageProtocol {
    func fetchMoviesPage(page: Int, completionHandler: @escaping (MoviesPage?, MoviesPageError?) -> Void)
}

enum MoviesPageError: Equatable, Error {
    case FetchError(String)
}
