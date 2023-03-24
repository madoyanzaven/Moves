//
//  Fetching.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import RxSwift

protocol Fetching {
    func fetchData(routing: Routing) -> Single<Data>
}
