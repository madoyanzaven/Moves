//
//  Coordinating.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import UIKit

protocol Coordinating {
    var navigationController: UINavigationController { get set }
    
    func start()
}
