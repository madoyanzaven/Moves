//
//  MovieListResponse.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation

struct MovieListResponse: Decodable {
    let results: [MovieResponse]
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
    }
}

struct MovieResponse: Decodable {
    let id: Int
    let title: String?
    let imagePath: String?
    let voteCount: Int?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case imagePath = "poster_path"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
    }
}
