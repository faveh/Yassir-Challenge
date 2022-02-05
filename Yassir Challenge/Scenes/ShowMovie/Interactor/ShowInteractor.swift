//
//  ShowInteractor.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 04/02/2022.
//

import Foundation

protocol ShowMovieBusinessLogic {
    func fetchMovie(request: ShowMovie.FetchMovie.Request)
}

protocol ShowMovieDataStore {
    var movie: Movie! { get set }
}

class ShowMovieInteractor: ShowMovieBusinessLogic, ShowMovieDataStore {
    var presenter: ShowMoviePresentationLogic?
    var showMovieWorker = ShowMovieWorker(movieDetailsProtocol: MovieDetailsAPI())
    var movie: Movie!
    
    func fetchMovie(request: ShowMovie.FetchMovie.Request) {
        showMovieWorker.fetchMovieDetails(movieID: request.movieID) { (movieDetails) in
            if let movieDetails = movieDetails {
                let response = ShowMovie.FetchMovie.Response(movie: movieDetails)
                self.presenter?.presentMovie(response: response)
            }
        }
    }
}
