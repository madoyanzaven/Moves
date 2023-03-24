//
//  MovieModelFactory.swift
//  MovesTests
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation

@testable import Moves

final class MovieModelFactory {
    static func create(id: Int,
                       title: String = "",
                       imagePath: String = "",
                       voteCount: Int = 0,
                       releaseDate: String = "",
                       overview: String = ""
    ) -> Moves.MovieModel {
        return MovieModel(
            id: id,
            title: title,
            imagePath: imagePath,
            voteCount: voteCount,
            releaseDate: releaseDate,
            overview: overview
        )
    }
}
