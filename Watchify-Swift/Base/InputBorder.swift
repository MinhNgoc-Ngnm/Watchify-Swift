//
//  InputBorder.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 08/02/2025.
//

import UIKit
import IQKeyboardReturnManager

@IBDesignable
class InputBorder: UIView {
    private let DEFAULT_BG_COLOR: UIColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1.0)
    
    @IBOutlet var inputViewOL: UIView!
    
    @IBOutlet weak var textFieldOL: UITextField!
    
    @IBOutlet weak var btnOL: UIButton!
    
    @IBInspectable var inputBg: UIColor? {
        didSet {
            self.inputViewOL.backgroundColor = inputBg ?? DEFAULT_BG_COLOR
        }
    }
    
    @IBInspectable var placeholder: String? {
        didSet {
            updatePlaceholder()
        }
    }
    
    @IBInspectable var placeholderColor: UIColor = UIColor.lightGray {
        didSet {
            updatePlaceholder()
        }
    }
    var textValue: String {
        return textFieldOL.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadView()
        self.setUp()
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
    func setUp(){
        self.inputViewOL.layer.cornerRadius = 10
        self.inputViewOL.layer.borderWidth = 0
        self.inputViewOL.layer.borderColor = nil
        self.textFieldOL.delegate = self
        self.btnOL.isHidden = true
    }
    
    private func updatePlaceholder() {
        if let placeholder = placeholder {
            textFieldOL.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
        } else {
            textFieldOL.attributedPlaceholder = nil
        }
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if let text = self.textFieldOL.text, !text.isEmpty {
            self.btnOL.isHidden = false
        }else {
            self.btnOL.isHidden = true
        }
    }
    @IBAction func clearBtnHandle(_ sender: UIButton) {
        self.textFieldOL.text = nil
        self.btnOL.isHidden = true
        UITextField.noti
    }
    
}

extension InputBorder: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.inputViewOL.layer.borderWidth = 1
        self.inputViewOL.layer.borderColor = UIColor.white.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.inputViewOL.layer.borderWidth = 0
        self.inputViewOL.layer.borderColor = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        <#code#>
    }
    
}
