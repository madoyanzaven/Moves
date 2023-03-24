//
//  MovieListViewModelTests.swift
//  MovesTests
//
//  Created by Zaven Madoyan on 24.03.23.
//

import XCTest
@testable import Moves

class MovieListViewModelTests: XCTestCase {
    var viewModel: MovieListViewModel!
    var service: MockMovieListService!
    
    override func setUp() {
        super.setUp()
        
        service = MockMovieListService()
        let inputs = MovieListInputs(movieListService: service)
        viewModel = MovieListViewModel(inputs: inputs)
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewModel = nil
        service = nil
    }
    
    func test_FetchData() {
        XCTAssertEqual(service.fetchMethodCallCount, 0, "fetchMethodCallCount default value is 0, fetch count is \(service.fetchMethodCallCount)")
        
        viewModel.loadMovieList()
        
        XCTAssertEqual(service.fetchMethodCallCount, 1, "fetchMethodCallCount is  \(service.fetchMethodCallCount), expected value: 1")
    }
}
