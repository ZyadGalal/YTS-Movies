//
//  MoviesListInteractor.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation

class MoviesListInteractor{
    func getMovies (completionHandler : @escaping (Result<MoviesListModel,Error>) -> ()){
        NetworkClient.performRequest(_type: MoviesListModel.self, router: .getMovies, completion: completionHandler)
    }
}
