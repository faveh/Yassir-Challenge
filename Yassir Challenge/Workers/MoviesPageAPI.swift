//
//  MoviesPageAPI.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MoviesPageAPI: MoviesPageProtocol {
    static let shared = MoviesPageAPI()
    
    func fetchMoviesPage(page: Int, completionHandler: @escaping (MoviesPage?, MoviesPageError?) -> Void) {
        let moviesPageAPI = "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(page)&with_watch_monetization_types=flatrate"
        
        
        guard let url = URL(string: moviesPageAPI) else {
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default).responseObject { (response: DataResponse<MoviesPage>) in
            completionHandler(response.result.value, MoviesPageError.FetchError(WorkerConstants.errorFetchingMoviesPage))
        }
    }
}
