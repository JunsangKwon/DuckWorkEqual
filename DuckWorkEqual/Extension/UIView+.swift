//
//  UIView+.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/19.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
