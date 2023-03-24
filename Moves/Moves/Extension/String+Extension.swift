//
//  String+Extension.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import Foundation

extension String {
    var toDateWithYearMonthDay: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
}
