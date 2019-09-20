//
//  MovieDetailsViewController.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        return scroll
    }()
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    let moviePoster : UIImageView = {
        let image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let ratingView : FloatRatingView = {
        let rating = FloatRatingView()
        rating.maxRating = 10
        rating.minRating = 0
        rating.fullImage = UIImage(named: "star")
        rating.emptyImage = UIImage(named : "emptystar")
        rating.translatesAutoresizingMaskIntoConstraints = false
        return rating
    }()
    let movieName : UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 1
        name.textColor = .white
        name.font = UIFont.boldSystemFont(ofSize: 22)
        return name
    }()
    let movieDescription : UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        description.textColor = .white
        description.font = UIFont.systemFont(ofSize: 17)
        return description
    }()
    
    var moviePresenter : MovieDetailsPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewConstraints()
        moviePresenter = MovieDetailsPresenter(view: self)
        moviePresenter.viewDidLoad()
    }
    func scrollViewConstraints(){
        self.view.addSubview(scrollView)
        scrollView.pin(to: view, with: 0)
        setupContainerView()
    }
    func setupContainerView(){
        scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
        posterImageConstraints()
        movieNameConstraints()
        movieDescriptionConstraints()
        movieRatingConstraints()
    }
    func posterImageConstraints(){
        containerView.addSubview(moviePoster)
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(equalTo: containerView.topAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            moviePoster.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            moviePoster.heightAnchor.constraint(equalToConstant: 300)
            ])
    }
    func movieNameConstraints(){
        containerView.addSubview(movieName)
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: moviePoster.bottomAnchor , constant: 8),
            movieName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 8),
            movieName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: -8),
            ])
    }
    func movieRatingConstraints (){
        containerView.addSubview(ratingView)
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: movieName.bottomAnchor , constant: 3),
            ratingView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 8),
            ratingView.heightAnchor.constraint(equalToConstant: 15),
            ratingView.widthAnchor.constraint(equalToConstant: 100),
            ratingView.bottomAnchor.constraint(equalTo: movieDescription.topAnchor, constant:  -3)
            ])
    }
    func movieDescriptionConstraints(){
        containerView.addSubview(movieDescription)
        NSLayoutConstraint.activate([
            //movieDescription.topAnchor.constraint(equalTo: ratingView.bottomAnchor , constant: 8),
            movieDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant:  8),
            movieDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant:  -8),
            movieDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
    }
    deinit {
        print("wow")
    }
}

extension MovieDetailsViewController : MovieDetails{
    func getMovieImage(image: String, name: String, description: String, rating: Double) {
        self.movieName.text = name
        self.movieDescription.text = description
        self.ratingView.rating = rating
        moviePoster.image = UIImage(named: "zozz")
    }
}
