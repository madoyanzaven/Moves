//
//  MovieListServiceAssembly.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import Swinject

final class MovieListServiceAssembly: Assembly {
    func assemble(container: Container) {
        let isMock = Environment.isMock
        
        if isMock {
            container.register(MovieListServicing.self) { _ in MovieListMockService(dataFetcher: DataFetcherManagerProvider.mock)}
        } else {
            container.register(MovieListServicing.self) { _ in MovieListWebService(dataFetcher: DataFetcherManagerProvider.web)}
        }
    }
}
