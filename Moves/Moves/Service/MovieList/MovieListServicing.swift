//
//  MovieListServicing.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import RxSwift

protocol MovieListServicing {
    func fetch(routing: MovieListParameter) -> Single<MovieListResponse>
}
