//
//  Constant.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import UIKit

enum Constants {
    enum API {
        case list
        case detail(Int)
        
        var path: String {
            switch self {
            case .list :
                return "/3/discover/movie"
            case let .detail(id):
                return "/3/movie/\(id)"
            }
        }
        var jsonFile: String {
            switch self {
            case .list:
                return "MovieList"
            case .detail:
                return "MovieDetail"
            }
        }
    }
}

extension Constants {
    enum BaseUrl {
        static var moviesApi = "https://api.themoviedb.org"
        static var imageAPI = "https://image.tmdb.org/t/p/w500"
    }
}

extension Constants {
    static var keyIdentifier = "api_key"
    static var apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
}

extension Constants {
    enum Images {
        static var noImage = UIImage(named: "no_image")
    }
}
