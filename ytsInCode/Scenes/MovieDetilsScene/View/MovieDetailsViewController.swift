//
//  MovieDetailsViewController.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    private lazy var mainView: MovieDetailsView = {
        return MovieDetailsView(frame: view.frame)
    }()
    var moviePresenter : MovieDetailsPresenter!
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.movieDescription.backgroundColor = .clear
        moviePresenter = MovieDetailsPresenter(view: self)
        moviePresenter.viewDidLoad()
    }
    deinit {
        print("wow")
    }
}

extension MovieDetailsViewController : MovieDetails{
    func getMovieImage(image: String, name: String, description: String, rating: Double) {
        mainView.movieName.text = name
        mainView.movieDescription.text = description
        mainView.ratingView.rating = rating
        mainView.moviePoster.image = UIImage(named: "zozz")
    }
}
