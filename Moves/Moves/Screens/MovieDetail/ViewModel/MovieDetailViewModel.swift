//
//  MovieDetailViewModel.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation
import RxSwift
import RxRelay

final class MovieDetailViewModel: MovieDetailModelBusinessRules {
    private weak var coordinator: MainCoordinator!
    private let inputs: MovieDetailInputs
    let disposeBag = DisposeBag()
    let displayPublishRelay = PublishRelay<MovieModel>()
    
    var selectedMovie: MovieModel?
    
    var navigationTitle: String {
        return "Movie Detail"
    }
    
    init(inputs: MovieDetailInputs) {
        self.inputs = inputs
    }
    
    func setup(with model: MovieModel, _ coordinator: MainCoordinator) {
        self.selectedMovie = model
        self.coordinator = coordinator
    }
    
    func loadDetail() {
        guard let movieId = selectedMovie?.id else { return }
        
        let parameter = MovieDetailParameter(id: movieId)
        inputs.movieDetail.fetch(routing: parameter).observe(on: MainScheduler.instance).subscribe(
            onSuccess: { [weak self] response in
                guard let self = self else { return }
                let movieModel = self.convertToMovieModel(response)
                self.displayPublishRelay.accept(movieModel)
            },
            onFailure: { [weak self] error in
                self?.coordinator?.showAlert(with: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

struct MovieDetailInputs {
    let movieDetail: MovieDetailServicing
}
