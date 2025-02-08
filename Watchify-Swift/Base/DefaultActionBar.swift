//
//  DefaultActionBar.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 08/02/2025.
//

import UIKit
@IBDesignable
class DefaultActionBar: UIView {
    @IBOutlet weak var titleOL: UILabel!
    
    @IBInspectable  var title: String? {
        didSet{
            titleOL.text = title
        }
    }
    
    var onBack: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
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

    @IBAction func backHandle(_ sender: UIButton) {
        if let onBack = self.onBack {
           onBack()
        }
    }
    
}
