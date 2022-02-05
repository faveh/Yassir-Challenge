//
//  ListMoviesInteractor.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation

protocol ListMoviesBusinessLogic {
    func fetchMovies(request: ListMovies.FetchMovies.Request)
}

protocol ListMoviesDataStore {
    var movies: [Movie] { get }
}

class ListMoviesInteractor: ListMoviesBusinessLogic, ListMoviesDataStore {
    var presenter: ListMoviesPresentationLogic?
    
    var listMoviesWorker = ListMoviesWorker(moviesPageProtocol: MoviesPageAPI())
    var movies: [Movie] = [Movie]()
    
    func fetchMovies(request: ListMovies.FetchMovies.Request) {
        listMoviesWorker.fetchMoviesPage(page: request.page) { (moviesPage) in
            if let resultMovies = moviesPage?.results {
                self.movies.append(contentsOf: resultMovies)
//                self.movies
                let response = ListMovies.FetchMovies.Response(movies: moviesPage?.results ?? [])
                self.presenter?.presentMovies(response: response)
            }
            
        }
    }
}
