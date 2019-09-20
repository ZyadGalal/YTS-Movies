//
//  APIRouter.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : URLRequestConvertible{
    case getMovies
    
    var method : HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    var path : String {
        switch self {
        case .getMovies:
            return "list_movies.json"
        }
    }
    var parameters : Parameters?{
        switch self {
        case .getMovies:
            return nil
        }
    }
    
    func asURLRequest () throws -> URLRequest{
        let url = try Constants.baseURL.asURL().appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        urlRequest.setValue(ContentType.apiRapidKey.rawValue, forHTTPHeaderField: HTTPHeaderField.apiRapidKey.rawValue)
        
        if let parameters = parameters {
            return try URLEncoding.default.encode(urlRequest, with: parameters)
            
        }
        return urlRequest
    }
}
