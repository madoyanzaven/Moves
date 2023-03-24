//
//  MovieDetailAssembly.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation
import Swinject

final class MovieDetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MovieDetailViewModel.self) { r in
            let inputs = MovieDetailInputs(movieDetail: r.resolve((MovieDetailServicing.self))!)
            
            return MovieDetailViewModel(inputs: inputs)
        }
        
        container.register(MovieDetailViewController.self) { r in
            let vc = MovieDetailViewController(viewModel: r.resolve(MovieDetailViewModel.self)!)
            
            return vc
        }
    }
}
