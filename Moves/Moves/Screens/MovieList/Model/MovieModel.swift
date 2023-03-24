//
//  MovieModel.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import UIKit

struct MovieModel {
    let id: Int
    let title: String
    let imagePath: String?
    let voteCount: Int?
    let releaseDate: String?
    
    var imageUrl: URL? {
        if let imagePath = imagePath {
            return URL(string: Constants.BaseUrl.imageAPI + imagePath)
        }
        
        return nil
    }
    
    var yearValue: String {
        guard let dateString = releaseDate,
              let date = dateString.toDateWithYearMonthDay,
              let yearString = date.toStringWithYear()
        else { return ""}
        
        return yearString
    }
    
    var voteValue: String {
        guard let vote = voteCount else { return String() }
        
        return "Votes: \(vote)"
    }
    
}
