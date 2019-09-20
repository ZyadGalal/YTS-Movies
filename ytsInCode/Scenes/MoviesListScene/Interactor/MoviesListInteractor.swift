//
//  MoviesListInteractor.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation

class MoviesListInteractor{
    typealias onSuccess = (_ response : MoviesListModel) -> ()
    typealias onFailure = (_ errorMessage : String)->()
    
    func getMovies (Success : @escaping onSuccess , Failure : @escaping onFailure){
        NetworkClient.performRequest(_type: MoviesListModel.self, router: APIRouter.getMovies, Success: { (lists) in
            Success(lists)
        }) { (error) in
            Failure(error)
        }
    }
}
