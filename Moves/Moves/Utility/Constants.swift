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

        var path: String {
            switch self {
            case .list :
                return "/api/episode"
            }
        }

        var jsonFile: String {
            switch self {
            case .list:
                return "CharacterList"
            }
        }
    }
}

extension Constants {
    enum BaseUrl {
        static var moviesApi = "https://api.themoviedb.org/3"
    }
}

extension Constants {
    enum Images {
        static var noImage = UIImage(named: "noImage")
    }
}

extension Constants {
    enum Colors {
        static var mainGray = UIColor(red: 60/255, green: 62/255, blue: 67/255, alpha: 1)
        static var darkGray = UIColor(red: 40/255, green: 43/255, blue: 50/255, alpha: 1)
        static var mainRed = UIColor(red: 197/255, green: 73/255, blue: 56/255, alpha: 1)
        static var mainGreen = UIColor(red: 118/255, green: 201/255, blue: 88/255, alpha: 1)
        static var statusGray = UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1)
    }
}
