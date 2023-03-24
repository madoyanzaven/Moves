//
//  MovieListParameter.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation

struct MovieListParameter: Routing {
    let page: Int
    
    var api: Constants.API {
        return .list
    }
    
    var parameters: [String: Any] {
        let parameters: [String: Any] = [
            "page": page,
            Constants.keyIdentifier : Constants.apiKey
        ]
        
        return parameters
    }
}
