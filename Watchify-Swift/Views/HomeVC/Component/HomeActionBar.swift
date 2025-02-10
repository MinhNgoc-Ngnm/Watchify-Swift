//
//  HomeActionBar.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 10/02/2025.
//

import UIKit

@IBDesignable
class HomeActionBar: UIView {
    
    @IBInspectable var icon: String? {
        return ""
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadView()
    }
    func loadView() {
        let bundle = Bundle(for: type(of: self))
        let className = String(describing: type(of: self))
        if let uiView = bundle.loadNibNamed(className, owner: self, options: nil)?.first as? UIView {
            uiView.frame = self.bounds
            self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(uiView)
        }
    }
}
