//
//  ShowMovieRouter.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 04/02/2022.
//

import Foundation

protocol ShowMovieDataPassing {
    var dataStore: ShowMovieDataStore? { get }
}

class ShowMovieRouter: NSObject, ShowMovieDataPassing {
    weak var viewController: ShowMovieViewController?
    var dataStore: ShowMovieDataStore?
}
