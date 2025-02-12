//
//  UIButton+Border.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 08/02/2025.
//

import Foundation
import UIKit

extension UIButton {
    
    @IBInspectable override var borderRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}
