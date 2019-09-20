//
//  MovieDetailsView.swift
//  ytsInCode
//
//  Created by zyad galal on 9/20/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class MovieDetailsView: UIView {

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayoutUI(){
        addSubView()
        setupConstraints()
    }
    func addSubView(){
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        addSubview(moviePoster)
        addSubview(movieName)
        addSubview(ratingView)
        addSubview(movieDescription)

    }
    func setupConstraints(){
        scrollView.pin(to: self, with: 0)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            moviePoster.topAnchor.constraint(equalTo: containerView.topAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            moviePoster.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            moviePoster.heightAnchor.constraint(equalToConstant: 300),
            movieName.topAnchor.constraint(equalTo: moviePoster.bottomAnchor , constant: 8),
            movieName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 8),
            movieName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: -8),
            ratingView.topAnchor.constraint(equalTo: movieName.bottomAnchor , constant: 3),
            ratingView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 8),
            ratingView.heightAnchor.constraint(equalToConstant: 20),
            ratingView.widthAnchor.constraint(equalToConstant: 110),
            movieDescription.topAnchor.constraint(equalTo: ratingView.bottomAnchor),
            movieDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant:  8),
            movieDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant:  -8),
            movieDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])


    }
    

}
