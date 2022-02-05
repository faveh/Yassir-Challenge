//
//  ShowMovieViewController.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 04/02/2022.
//

import UIKit
import Kingfisher

protocol ShowMovieDisplayLogic: AnyObject {
    func displayMovie(viewModel: ShowMovie.FetchMovie.ViewModel)
}

class ShowMovieViewController: UIViewController, ShowMovieDisplayLogic {
    var interactor: ShowMovieInteractor?
    var router: (NSObjectProtocol & ShowMovieDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupView()
        configureNavigationBar()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupView()
        configureNavigationBar()
        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        fetchMovie()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(red: 14, green: 21, blue: 40)
        let viewController = self
        let interactor = ShowMovieInteractor()
        let presenter = ShowMoviePresenter()
        let router = ShowMovieRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private let backdropView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
//        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    let movieTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    let releaseDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    private let ratingIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        return imageView
    }()
    let rating: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    let runtime: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    private let downloadIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "icloud.and.arrow.down")
        imageView.tintColor = .systemCyan
        return imageView
    }()
    let languages: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    let overviewTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Overview"
        label.textColor = .white
        return label
    }()
    let overview: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.textContainer.maximumNumberOfLines = 10
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.backgroundColor = .clear
        textView.textColor = .white
        return textView
    }()
    let genres: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    func configureNavigationBar() {

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "heart"),
                style: .done,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                image: UIImage(systemName: "square.and.arrow.up"),
                style: .done,
                target: self,
                action: nil
            )
        ]
    }
    
    func configureConstraints() {
        view.addSubview(backdropView)
        view.addSubview(posterView)
        view.addSubview(movieTitle)
        view.addSubview(releaseDate)
        view.addSubview(runtime)
        view.addSubview(ratingIcon)
        view.addSubview(rating)
        view.addSubview(languages)
        view.addSubview(genres)
        view.addSubview(downloadIcon)
        view.addSubview(overviewTitle)
        view.addSubview(overview)

        NSLayoutConstraint.activate([
            backdropView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backdropView.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor),
            backdropView.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor),
            backdropView.heightAnchor.constraint(equalToConstant: 300),

            posterView.topAnchor.constraint(equalTo: backdropView.bottomAnchor, constant: 10),
            posterView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            posterView.widthAnchor.constraint(equalToConstant: 90),
            posterView.heightAnchor.constraint(equalToConstant: 130),

            movieTitle.topAnchor.constraint(equalTo: backdropView.bottomAnchor, constant: 10),
            movieTitle.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 15),
            movieTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),

            releaseDate.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 5),
            releaseDate.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 15),
            releaseDate.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),

            runtime.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 5),
            runtime.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 15),

            ratingIcon.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 5),
            ratingIcon.leadingAnchor.constraint(equalTo: runtime.trailingAnchor, constant: 5),
            ratingIcon.widthAnchor.constraint(equalToConstant: 15),
            ratingIcon.heightAnchor.constraint(equalToConstant: 15),

            
            rating.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 5),
            rating.leadingAnchor.constraint(equalTo: ratingIcon.trailingAnchor, constant: 5),

            languages.topAnchor.constraint(equalTo: runtime.bottomAnchor, constant: 5),
            languages.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 15),

            genres.topAnchor.constraint(equalTo: languages.bottomAnchor, constant: 5),
            genres.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 10),
            genres.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),

            downloadIcon.topAnchor.constraint(equalTo: genres.bottomAnchor, constant: 10),
            downloadIcon.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            downloadIcon.widthAnchor.constraint(equalToConstant: 30),
            downloadIcon.heightAnchor.constraint(equalToConstant: 30),
            
            overviewTitle.topAnchor.constraint(equalTo: downloadIcon.bottomAnchor, constant: 15),
            overviewTitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),

            overview.topAnchor.constraint(equalTo: overviewTitle.bottomAnchor, constant: 10),
            overview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            overview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    func fetchMovie() {
        let request = ShowMovie.FetchMovie.Request(movieID: (router?.dataStore?.movie.id)!)
        interactor?.fetchMovie(request: request)
    }
    
    func displayMovie(viewModel: ShowMovie.FetchMovie.ViewModel) {
        let movieToShow = viewModel.displayedMovie
        if (!movieToShow.posterURL.isEmpty) {
            let baseURL = "https://image.tmdb.org/t/p/w500"
            let resource = ImageResource(downloadURL: URL(string: baseURL + movieToShow.posterURL)!)
            self.posterView.kf.setImage(
                with: resource,
                placeholder: nil,
                options: [
                ]) { result in
                switch result {
                case .success(_): break
                case .failure(_):
                    self.posterView.image = UIImage(named: "defaultImage")
                }
            }
        } else {
            self.posterView.image = UIImage(named: "defaultImage")
        }
        
        if (!movieToShow.posterURL.isEmpty) {
            let baseURL = "https://image.tmdb.org/t/p/w500"
            let resource = ImageResource(downloadURL: URL(string: baseURL + movieToShow.backDropURL)!)
            self.backdropView.kf.setImage(
                with: resource,
                placeholder: nil,
                options: [
                ]) { result in
                switch result {
                case .success(_): break
                case .failure(_):
                    self.backdropView.image = UIImage(named: "defaultImage")
                }
            }
        } else {
            self.backdropView.image = UIImage(named: "defaultImage")
        }
        movieTitle.text = movieToShow.title
        releaseDate.text = movieToShow.releaseDate
        rating.text = String(movieToShow.rating)
        runtime.text = movieToShow.length
        languages.text = movieToShow.language.joined(separator: ", ")
        genres.text = movieToShow.genres.joined(separator: " | ")
        overview.text = movieToShow.overview
    }
}
