//
//  MovieCell.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 04/02/2022.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    static let identifier = "MovieCellID"
    
    private let newContainView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .clear
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()

    let movieYear: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    let overview: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.textContainer.maximumNumberOfLines = 4
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.backgroundColor = .clear
        textView.textColor = .white
        return textView
    }()
    
    private let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 14, green: 21, blue: 40)

        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        addSubview(newContainView)
        newContainView.addSubview(poster)
        newContainView.addSubview(movieTitle)
        newContainView.addSubview(movieYear)
        newContainView.addSubview(overview)

        NSLayoutConstraint.activate([
            newContainView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            newContainView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            newContainView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            newContainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            poster.topAnchor.constraint(equalTo: newContainView.topAnchor, constant: 20),
            poster.leadingAnchor.constraint(equalTo: newContainView.leadingAnchor, constant: 20),
            poster.bottomAnchor.constraint(equalTo: newContainView.bottomAnchor, constant: -20),
            poster.widthAnchor.constraint(equalToConstant: 90),
            poster.heightAnchor.constraint(equalToConstant: 130),

            movieTitle.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 10),
            movieTitle.trailingAnchor.constraint(equalTo: newContainView.trailingAnchor, constant: -10),
            movieTitle.topAnchor.constraint(equalTo: newContainView.topAnchor, constant: 20),

            overview.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 2),
            overview.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 10),
            overview.trailingAnchor.constraint(equalTo: newContainView.trailingAnchor, constant: -10),

            movieYear.topAnchor.constraint(equalTo: overview.bottomAnchor, constant: 2),
            movieYear.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 10),
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func displayPost(_ movie: ListMovies.FetchMovies.ViewModel.DisplayedMovie) {
        
        if (!movie.posterURL.isEmpty) {
            let baseURL = "https://image.tmdb.org/t/p/w500"
            let resource = ImageResource(downloadURL: URL(string: baseURL + movie.posterURL)!)
            self.poster.kf.setImage(
                with: resource,
                placeholder: nil,
                options: [
                    .processor(DownsamplingImageProcessor(size: CGSize(width: 90, height: 130)))
                ]) { result in
                switch result {
                case .success(_): break
                case .failure(_):
                    self.poster.image = UIImage(named: "defaultImage")
                }
            }
        } else {
            self.poster.image = UIImage(named: "defaultImage")
        }

        self.movieTitle.text = movie.title
        self.movieYear.text = movie.year
        self.overview.text = movie.overview
    }
}
