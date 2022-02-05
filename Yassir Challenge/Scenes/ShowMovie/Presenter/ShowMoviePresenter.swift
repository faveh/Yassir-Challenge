//
//  ShowMoviePresenter.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 04/02/2022.
//

import Foundation

protocol ShowMoviePresentationLogic {
    func presentMovie(response: ShowMovie.FetchMovie.Response)
}

class ShowMoviePresenter: ShowMoviePresentationLogic {
    weak var viewController: ShowMovieDisplayLogic?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
    
    func presentMovie(response: ShowMovie.FetchMovie.Response) {
        var movie = response.movie
        var genreNames = [String]()
        var languageNames = [String]()
        var length = ""
        var dateString = ""
        if let genres = movie.genres {
            genreNames = genres.map { $0.name ?? "" }
        }
        if let languages = movie.spoken_languages {
            languageNames = languages.map { $0.name ?? "" }
        }
        
        if let runtime = movie.runtime {
            let hour = runtime / 60
            let leftMinutes = runtime % 60
            length = "\(hour)h \(leftMinutes)min"
        }
        
        if let releaseDate = movie.release_date {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: releaseDate)!
            
            dateFormatter.dateFormat = "MMM d, yyyy"
            dateString = dateFormatter.string(from: date)
        }
        
        let displayedMovie = ShowMovie.FetchMovie.ViewModel.DisplayedMovie(tagline: movie.tagline ?? "", title: movie.title ?? "", overview: movie.overview ?? "", genres: genreNames, language: languageNames, rating: movie.vote_average ?? 0, length: length, releaseDate: dateString, posterURL: movie.poster_path ?? "", backDropURL: movie.backdrop_path ?? "")
        let viewModel = ShowMovie.FetchMovie.ViewModel(displayedMovie: displayedMovie)
        viewController?.displayMovie(viewModel: viewModel)
    }
}
