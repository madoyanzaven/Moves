//
//  MovieListMockService.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import RxSwift

final class MovieListMockService: Service, MovieListServicing {
    func fetch(routing: MovieListParameter) -> Single<MovieListResponse> {
        return call(routing: routing)
    }
}
