//
//  MockMovieListService.swift
//  MovesTests
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation
import RxSwift

@testable import Moves

final class MockMovieListService: BaseMockService, MovieListServicing {
    func fetch(routing: MovieListParameter) -> Single<MovieListResponse> {
        fetchMethodCallCount += 1
        
        return Single.create { single in
            guard !self.shouldThrowError else {
                single(.failure(MockError.failure))
                
                return Disposables.create()
            }
            
            let response = MovieListResponseFactory.createMovieResponse()
            
            single(.success(response))
            
            return Disposables.create()
        }
    }
}
