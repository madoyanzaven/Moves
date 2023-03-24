//
//  MainCoordinator.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import UIKit

final class MainCoordinator: Coordinating {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewControllerProvider.Main.list
        
        vc.viewModel.setupCoordinator(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushToDetail(with model: MovieModel) {
        let detailVC = ViewControllerProvider.Main.detail
        
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Something went wrong.",
                                      message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))
        
        navigationController.present(alert, animated: true)
    }
}
