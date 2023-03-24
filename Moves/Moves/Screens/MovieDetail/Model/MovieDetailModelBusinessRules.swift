//
//  MovieDetailModelBusinessRules.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

protocol MovieDetailModelBusinessRules {
    func convertToMovieModel(_ responseModel: MovieResponse) -> MovieModel
}

extension MovieDetailModelBusinessRules {
    
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
