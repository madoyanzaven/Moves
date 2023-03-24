//
//  MovieListBusinessRules.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation

protocol MovieListBusinessRules {
    func isPageNotOffset(_ currentPage: Int, _ totalPage: Int) -> Bool
    func convertToMovieModel(_ responseModel: MovieResponse) -> MovieModel
}

extension MovieListBusinessRules {
    func isPageNotOffset(_ currentPage: Int, _ totalPages: Int) -> Bool {
        return totalPages >= currentPage
    }
    
    func convertToMovieModel(_ responseModel: MovieResponse) -> MovieModel {
        return MovieModel(
            id: responseModel.id,
            title: responseModel.title ?? "",
            imagePath: responseModel.imagePath,
            voteCount: responseModel.voteCount,
            releaseDate: responseModel.releaseDate,
            overview: responseModel.overview
        )
    }
}
