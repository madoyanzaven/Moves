//
//  ViewControllerProvider.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import UIKit
import Swinject

enum ViewControllerProvider {}

extension ViewControllerProvider {
    enum Main {
        static var list: MovieListTableViewController {
            let assemblies: [Assembly] = [
                MovieListServiceAssembly(),
                MovieListAssembly()
            ]
            let assembler = Assembler(assemblies)
            let vc = assembler.resolver.resolve(MovieListTableViewController.self)!
            
            return vc
        }
        
        static var detail: MovieDetailViewController {
            let assemblies: [Assembly] = [
                MovieDetailServiceAssembly(),
                MovieDetailAssembly()
            ]
            let assembler = Assembler(assemblies)
            let vc = assembler.resolver.resolve(MovieDetailViewController.self)!

            return vc
        }
    }
}
