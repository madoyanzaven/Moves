//
//  UIView+Extension.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import UIKit

extension UIView {
    class func loadFromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
