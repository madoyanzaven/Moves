//
//  MovieDetailParameter.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation

struct MovieDetailParameter: Routing {
    let id: Int
    
    var api: Constants.API {
        return .detail(id)
    }
    
    var parameters: [String: Any] {
        let parameters: [String: Any] = [
            Constants.keyIdentifier : Constants.apiKey
        ]
        
        return parameters
    }
}
