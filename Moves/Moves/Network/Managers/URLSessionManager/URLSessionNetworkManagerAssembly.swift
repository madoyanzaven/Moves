//
//  URLSessionNetworkManagerAssembly.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import Swinject

struct URLSessionNetworkManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Fetching.self) { _ in URLSessionNetworkManager() }
    }
}
