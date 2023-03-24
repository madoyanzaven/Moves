//
//  MovieListViewModel.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import RxSwift
import RxRelay

final class MovieListViewModel: MovieListBusinessRules {
    private weak var coordinator : MainCoordinator!
    let updatedIndexPathBehaviorRelay: BehaviorRelay<[IndexPath]?> = BehaviorRelay(value: nil)
    let disposeBag = DisposeBag()
    var isLoading = false
    
    private var totalPages = 1
    private var currentPage = 1
    private let inputs: MovieListInputs
    private var movies: [MovieModel] = []
    private var indexPaths: [IndexPath] = []
    
    var navigationTitle: String {
        return "Movie List"
    }
    var moviesModel: [MovieModel] {
        return movies
    }
    var pageNotOffset: Bool {
        return isPageNotOffset(currentPage, totalPages)
    }
    
    init(inputs: MovieListInputs) {
        self.inputs = inputs
    }
    
    func setupCoordinator(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadMovieList() {
        isLoading = true
        let parameter = MovieListParameter(
            page: currentPage)
        inputs.movieListService.fetch(routing: parameter).observe(on: MainScheduler.instance).subscribe(
            onSuccess: { [weak self] response in
                guard let strongSelf = self else { return }
                
                let models = response.results.map {
                    strongSelf.convertToMovieModel($0)
                }
                strongSelf.totalPages = response.totalPages
                strongSelf.isLoading = false
                strongSelf.currentPage += 1
                guard !strongSelf.moviesModel.isEmpty else {
                    strongSelf.movies.append(contentsOf: models)
                    strongSelf.updatedIndexPathBehaviorRelay.accept(strongSelf.indexPaths)
                    return
                }
                self?.updateCells(with: models)
            },
            onFailure: { [weak self] error in
                self?.isLoading = false
                self?.coordinator?.showAlert(with: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    func reloadPage() {
        currentPage = 1
        movies.removeAll()
        indexPaths.removeAll()
        loadMovieList()
    }
    
    func pushToDetail(_ indexPath: IndexPath) {
        guard let selectedCharacter =
                moviesModel[safe: indexPath.row] else { return }
        coordinator.pushToDetail(with: selectedCharacter)
    }
    
    private func updateCells(with characters: [MovieModel]) {
        indexPaths.removeAll()
        let oldCharacterCount = moviesModel.count
        let newRows = oldCharacterCount + characters.count
        
        for row in oldCharacterCount..<newRows {
            indexPaths.append(IndexPath(row: row, section: 0))
        }
        self.movies.append(contentsOf: characters)
        self.updatedIndexPathBehaviorRelay.accept(self.indexPaths)
    }
}

struct MovieListInputs {
    let movieListService: MovieListServicing
}
