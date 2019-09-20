//
//  MoviesController.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

protocol MoviesView : class{
    func getMoviesNumber(movies : Int)
    func fetchDataSuccess()
    func fetchDataFailed(message : String)
}
protocol MovieCellView {
    func getMoviesInfo(coverURL : String)
}
class MoviesPresenter  {

    private weak var movieView : MoviesView?
    private var interactor = MoviesListInteractor()
    private var movies : MoviesListModel?
    init(view : MoviesView) {
        self.movieView = view
    }
    func viewDidLoad() {
        getMovies()
    }
    func getMovies(){
        interactor.getMovies { [weak self](result) in
            guard let self = self else { return }
            switch result{
            case .success(let lists):
                self.movieView?.getMoviesNumber(movies: lists.data.movies.count)
                self.movies = lists
                self.movieView?.fetchDataSuccess()
            case .failure(let error):
                self.movieView?.fetchDataFailed(message: error.localizedDescription)
            }
        }
    }

    func config(cell : MovieCellView,at index : Int){
        guard let movie = movies?.data.movies[index] else {return}
        	
        cell.getMoviesInfo(coverURL: movie.mediumCoverImage)
    }
    func didSelectCell (at index : Int){
        
    }
}
