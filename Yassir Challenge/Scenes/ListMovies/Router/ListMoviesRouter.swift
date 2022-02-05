//
//  ListMoviesRouter.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 03/02/2022.
//

import Foundation
import UIKit

@objc protocol ListMoviesRoutingLogic {
    func routeToShowMovie()
}

protocol ListMoviesDataPassing {
    var dataStore: ListMoviesDataStore? { get }
}

class ListMoviesRouter: NSObject, ListMoviesRoutingLogic, ListMoviesDataPassing {
    weak var viewController: ListMoviesViewController?
    var dataStore: ListMoviesDataStore?
    
    func routeToShowMovie() {
        let showMovieVC = ShowMovieViewController()
        var showMovieDS = showMovieVC.router!.dataStore!
        sendataToShowMovie(source: dataStore!, destination: &showMovieDS)
        navigateToShowOrder(source: viewController!, destination: showMovieVC)
    }
    
    func sendataToShowMovie(source: ListMoviesDataStore, destination: inout ShowMovieDataStore) {
        guard let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row else { return }
        destination.movie = source.movies[selectedRow]
    }
    
    func navigateToShowOrder(source: ListMoviesViewController, destination: ShowMovieViewController) {
        source.show(destination, sender: nil)
    }
}
