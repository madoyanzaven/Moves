//
//  Parsing.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import RxSwift

protocol Parsing {
    func parse<T: Decodable>(data: Data) -> Single<T>
}
