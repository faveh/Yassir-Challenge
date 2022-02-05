//
//  ShowMovieWorker.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 04/02/2022.
//

import Foundation

class ShowMovieWorker {
    var movieDetailsProtocol: MovieDetailsProtocol
    
    init(movieDetailsProtocol: MovieDetailsProtocol) {
        self.movieDetailsProtocol = movieDetailsProtocol
    }
    
    func fetchMovieDetails(movieID: Int, completionHandler: @escaping (MovieDetails?) -> Void) {
        movieDetailsProtocol.fetchMovieDetails(movieID: movieID) { movieDetails, error in
            do {
                if let movieDetails = movieDetails {
                    DispatchQueue.main.async {
                        completionHandler(movieDetails)
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
}
