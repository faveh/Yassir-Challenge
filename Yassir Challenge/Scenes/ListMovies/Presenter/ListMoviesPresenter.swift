//
//  ListMoviesPresenter.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation

protocol ListMoviesPresentationLogic {
    func presentMovies(response: ListMovies.FetchMovies.Response)
}

class ListMoviesPresenter: ListMoviesPresentationLogic {
    weak var viewController: MoviesDisplayLogic?
    
    let dateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      return dateFormatter
    }()
    
    func presentMovies(response: ListMovies.FetchMovies.Response) {
        var moviesToBeDisplayed: [ListMovies.FetchMovies.ViewModel.DisplayedMovie] = []
        for movie in response.movies {
            var yearString = ""
            if let releaseDate = movie.release_date {
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from: releaseDate)!
                
                dateFormatter.dateFormat = "yyyy"
                yearString = dateFormatter.string(from: date)
            }
            
            let movieToDisplay = ListMovies.FetchMovies.ViewModel.DisplayedMovie(title: movie.title ?? "", posterURL: movie.poster_path ?? "", year: yearString, overview: movie.overview ?? "")
            moviesToBeDisplayed.append(movieToDisplay)
        }
        
        let viewModel = ListMovies.FetchMovies.ViewModel(displayedMovies: moviesToBeDisplayed)
        viewController?.displayMovies(viewModel: viewModel)
    }
}
