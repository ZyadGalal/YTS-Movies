//
//  MoviesController.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

protocol Movies : class{
    func getMoviesNumber(movies : Int)
    func fetchDataSuccess()
    func fetchDataFailed(message : String)
}
protocol MovieCellView {
    func getMoviesInfo(coverURL : String)
}
class MoviesPresenter  {

    private weak var delegate : Movies?
    private var interactor = MoviesListInteractor()
    private var movies : MoviesListModel?
    init(delegate : Movies) {
        self.delegate = delegate
    }
    func viewDidLoad() {
        getMovies()
    }
    func getMovies(){
        interactor.getMovies(Success: { [weak self] (lists) in
            guard let self = self else { return }
            self.delegate?.getMoviesNumber(movies: lists.data.movies.count)
            self.movies = lists
            self.delegate?.fetchDataSuccess()
        }) { (error) in
            self.delegate?.fetchDataFailed(message: error)
        }
    }

    func config(cell : MovieCellView,at index : Int){
        guard let movie = movies?.data.movies[index] else {return}
        	
        cell.getMoviesInfo(coverURL: movie.mediumCoverImage)
    }
}
