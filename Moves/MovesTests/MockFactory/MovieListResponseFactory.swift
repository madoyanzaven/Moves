//
//  MovieListResponseFactory.swift
//  MovesTests
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation

@testable import Moves

final class MovieListResponseFactory {
    static func createMovieResponse(page: Int = 1,
                                    count: Int = 1) -> Moves.MovieListResponse {
        let movies = Array(repeating:
                            MovieResponseFactory.create(),
                           count: count)
        return MovieListResponse(
            results: movies,
            totalPages: page)
    }
}

