//
//  MovieListBusinessRulesTests.swift
//  MovesTests
//
//  Created by Zaven Madoyan on 24.03.23.
//

import XCTest
@testable import Moves

final class MovieListBusinessRulesTests: XCTestCase {
    private struct MockedMovieListBusinessRules: MovieListBusinessRules {}
    private let movieListBusinessRulesTests = MockedMovieListBusinessRules()
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testIsPageNotOffset() {
        let actualResult = movieListBusinessRulesTests.isPageNotOffset(1, 10)
        
        XCTAssertTrue(actualResult)
    }
    
    func testMovieConvertModel() {
        let movieResponse = MovieResponseFactory.create(id: 2)
        let actualResult = movieListBusinessRulesTests.convertToMovieModel(movieResponse)
        
        XCTAssertEqual(movieResponse.id, actualResult.id, "Not expected model")
    }
    
    func testMovieImageField() {
        let expectedResult = "/image/path.png"
        let movieResponse = MovieResponseFactory.create(imagePath: expectedResult)
        let actualResult = movieListBusinessRulesTests.convertToMovieModel(movieResponse)
        
        XCTAssertEqual(movieResponse.imagePath, actualResult.imagePath, "Not expected model")
    }
    
    func testEmptyList() {
        let movieResponse = MovieListResponseFactory.createMovieResponse(count: 0)
        let actualResult = movieResponse.results
        
        XCTAssertTrue(actualResult.isEmpty)
    }
}
