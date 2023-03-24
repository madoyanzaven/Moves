//
//  MovieListAssembly.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import Swinject

final class MovieListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MovieListViewModel.self) { r in
            let inputs = MovieListInputs(movieListService: r.resolve((MovieListServicing.self))!)
            
            return MovieListViewModel(inputs: inputs)
        }
        
        container.register(MovieListTableViewController.self) { r in
            let vc = MovieListTableViewController(viewModel: r.resolve(MovieListViewModel.self)!)
            
            return vc
        }
    }
}
