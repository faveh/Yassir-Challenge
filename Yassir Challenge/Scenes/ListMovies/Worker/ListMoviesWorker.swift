//
//  ListMoviesWorker.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation

class ListMoviesWorker {
    var moviesPageProtocol: MoviesPageProtocol
    
    init(moviesPageProtocol: MoviesPageProtocol) {
        self.moviesPageProtocol = moviesPageProtocol
    }
    
    func fetchMoviesPage(page: Int, completionHandler: @escaping (MoviesPage?) -> Void) {
        moviesPageProtocol.fetchMoviesPage(page: page) { moviesPage, error in
            do {
                if let moviesPage = try moviesPage {
                    DispatchQueue.main.async {
                        completionHandler(moviesPage)
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
