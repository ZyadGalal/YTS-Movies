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
    func getMoviesImages(moviesURL : String)
}
class MoviesPresenter  {

    private weak var delegate : Movies?
    init(delegate : Movies) {
        self.delegate = delegate
    }
    func viewDidLoad() {
        delegate?.getMoviesNumber(movies: 10)
    }

}
