//
//  NetworkClient.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation
import Alamofire
class NetworkClient{
    typealias onSuccess<T> = (T) -> ()
    typealias onFailure = (_ errorMessage : String)->()
    
    static func performRequest<T> (_type:T.Type ,router : APIRouter , Success : @escaping onSuccess<T> , Failure : @escaping onFailure) where T : Decodable{
        Alamofire.request(router).responseJSON { (response) in
            do{
                let response = try JSONDecoder().decode(T.self, from: response.data!)
                Success(response)
            }
            catch let error{
                Failure(error.localizedDescription)
            }
        }
    }
}
