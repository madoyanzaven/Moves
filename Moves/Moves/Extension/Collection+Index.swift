//
//  Collection+Index.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation

extension Collection {
    subscript (safe index: Self.Index) -> Element? {
        guard indices.contains(index) else { return nil }
        
        return self[index]
    }
}
