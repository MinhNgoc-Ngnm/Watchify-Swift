//
//  UIView+Border.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 10/02/2025.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var borderRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
