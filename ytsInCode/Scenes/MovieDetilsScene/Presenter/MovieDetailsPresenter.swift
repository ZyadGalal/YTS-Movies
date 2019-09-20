//
//  MovieDetailsPresenter.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation

protocol MovieDetails : class{
    func getMovieImage(image : String , name : String , description : String , rating : Double)
}
class MovieDetailsPresenter {
    private weak var movieDetails : MovieDetails?
    init (view : MovieDetails){
        self.movieDetails = view
    }
    func viewDidLoad(){
        movieDetails?.getMovieImage(image: "cd", name: "zozz", description: "zyad mahmoud galal el din soliman ", rating: 5)
    }
}
