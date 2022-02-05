//
//  ListMovieViewControllerTests.swift
//  YassirChallengeTests
//
//  Created by Ayodimeji Adejuwon on 05/02/2022.
//

import XCTest
@testable import Yassir_Challenge

class ListMovieViewControllerTests: XCTestCase {

    var sut: ListMoviesViewController!
    var window: UIWindow!
    
    
    override func setUpWithError() throws {
        super.setUp()
        window = UIWindow()
        setupListMoviesViewController()
    }
    
    override func tearDownWithError() throws {
        window = nil
        super.tearDown()
    }
    
    func setupListMoviesViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "ListMoviesViewController") as? ListMoviesViewController
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    class ListMoviesBusinessLogicSpy: ListMoviesBusinessLogic
    {
        
        var movie: [Movie]?
        
        // MARK: Method call expectations
        
        var calledFetchMovie = false
        
        // MARK: Spied methods
        func fetchMovies(request: ListMovies.FetchMovies.Request) {
            calledFetchMovie = true
        }
    }
    
    class TableViewSpy: UITableView
    {
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    func testShouldDisplayMovies()
    {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        
        // When
        let displayedMovies = [ListMovies.FetchMovies.ViewModel.DisplayedMovie(title: "Movie 1", posterURL: "imageURL", year: "2020", overview: "First Overview")]
        let viewModel = ListMovies.FetchMovies.ViewModel(displayedMovies: displayedMovies)
        sut.displayMovies(viewModel: viewModel)
        
        // Then
        XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched movies should cause tableview to reload")
    }
    
    func testNumberOfSectionsInTableViewShouldAlwaysBeOne()
    {
        // Given
        let tableView = sut.tableView
        
        // When
        let numberOfSections = sut.numberOfSections(in: tableView!)
        
        // Then
        XCTAssertEqual(numberOfSections, 1, "Table view number of sections should always be 1")
    }

    func testNumberOfRowsInAnySectionShouldEqaulNumberOfMoviesToDisplay()
    {
        // Given
        let tableView = sut.tableView
        let displayedMovies = [ListMovies.FetchMovies.ViewModel.DisplayedMovie(title: "Movie 1", posterURL: "imageURL", year: "2020", overview: "First Overview")]
        sut.moviesToBeDisplayed = displayedMovies
        
        // When
        let numberOfRows = sut.tableView(tableView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, displayedMovies.count, "The number of table view rows should equal the number of movies to be display")
    }
    
    func testShouldConfigureTableViewCellToDisplayMovie()
    {
        // Given
        let tableView = sut.tableView
        let displayedMovies = [ListMovies.FetchMovies.ViewModel.DisplayedMovie(title: "Movie 1", posterURL: "imageURL", year: "2020", overview: "First Overview")]
        sut.moviesToBeDisplayed = displayedMovies

        tableView?.reloadData()
        // When
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView!, cellForRowAt: IndexPath(row: 0, section: 0)) as? MovieCell
        
        // Then
        XCTAssertEqual(cell?.movieTitle.text, "Movie 1", "A properly configured table view cell should display the movie title")
        XCTAssertEqual(cell?.movieYear.text, "2020", "A properly configured table view cell should display the movie year")
        XCTAssertEqual(cell?.overview.text, "First Overview", "A properly configured table view cell should display the movie overview")
    }
    
    func testHeightOfRowsInAnySection()
    {
        // Given
        let tableView = sut.tableView
        let displayedMovies = [ListMovies.FetchMovies.ViewModel.DisplayedMovie(title: "Movie 1", posterURL: "imageURL", year: "2020", overview: "First Overview")]
        sut.moviesToBeDisplayed = displayedMovies
        
        // When
        let heightOfRows = sut.tableView(tableView!, heightForRowAt: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertEqual(Int(heightOfRows), 160, "The number of table view rows should equal the number of movies to be display")
    }
}
