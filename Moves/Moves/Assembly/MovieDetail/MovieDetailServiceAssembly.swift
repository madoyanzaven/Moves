//
//  MovieDetailServiceAssembly.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation
import Swinject

final class MovieDetailServiceAssembly: Assembly {
    func assemble(container: Container) {
        let isMock = Environment.isMock
        
        if isMock {
            container.register(MovieDetailServicing.self) { _ in MovieDetailMockService(dataFetcher: DataFetcherManagerProvider.mock)}
        } else {
            container.register(MovieDetailServicing.self) { _ in MovieDetailWebService(dataFetcher: DataFetcherManagerProvider.web)}
        }
    }
}
