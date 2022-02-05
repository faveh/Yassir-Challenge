//
//  MovieDetailsAPI.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MovieDetailsAPI: MovieDetailsProtocol {
    static let shared = MovieDetailsAPI()
    
    func fetchMovieDetails(movieID: Int, completionHandler: @escaping (MovieDetails?, MovieDetailsError?) -> Void) {
        let movieDetailsAPI = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3&language=en-US"
        guard let url = URL(string: movieDetailsAPI) else {
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default).responseObject { (response: DataResponse<MovieDetails>) in
            completionHandler(response.result.value, MovieDetailsError.FetchError(WorkerConstants.errorFetchingMovieDetails))
        }
    }
}
