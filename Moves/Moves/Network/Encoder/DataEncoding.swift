//
//  DataEncoding.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation

protocol DataEncoding {
    func encode(urlRequest: inout URLRequest, parameters: [String: Any])
}
