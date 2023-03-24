//
//  Date+Extension.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation

extension Date {
    func toStringWithYear() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
}
