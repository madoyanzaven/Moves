//
//  MovieResponseFactory.swift
//  MovesTests
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation

@testable import Moves

final class MovieResponseFactory {
    static func create(id: Int = 1,
                       title: String = "",
                       imagePath: String = "",
                       voteCount: Int = 0,
                       releaseDate: String = "",
                       overview: String = "") -> Moves.MovieResponse {
        return MovieResponse(id: id,
                             title: title,
                             imagePath: imagePath,
                             voteCount: voteCount,
                             releaseDate: releaseDate,
                             overview: overview
        )
    }
}
