//
//  MovieDetailWebService.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation
import RxSwift

final class MovieDetailWebService: Service, MovieDetailServicing {
    func fetch(routing: MovieDetailParameter) -> Single<MovieResponse> {
        return call(routing: routing)
    }
}
