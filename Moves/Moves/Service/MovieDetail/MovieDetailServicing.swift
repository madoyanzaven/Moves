//
//  MovieDetailServicing.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation
import RxSwift

protocol MovieDetailServicing {
    func fetch(routing: MovieDetailParameter) -> Single<MovieResponse>
}
