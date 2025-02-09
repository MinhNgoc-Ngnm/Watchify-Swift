//
//  InputBorder.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 08/02/2025.
//

import UIKit
import IQKeyboardReturnManager


protocol InputBorderDelegate: AnyObject {
    func inputBorderBackTap(_ inputBorder: InputBorder, textField: UITextField)
    func inputBorderDidBeginEditing(_ inputBorder: InputBorder, textField: UITextField)
    func inputBorderDidEndEditing(_ inputBorder: InputBorder, textField: UITextField)
}

@IBDesignable
class InputBorder: UIView {
    weak var delegate: InputBorderDelegate?
    
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
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet{
            self.inputViewOL.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var isSecureTextEntry: Bool = false {
        didSet {
            self.textFieldOL.isSecureTextEntry = isSecureTextEntry
        }
    }
    
    @IBInspectable var imageBtn: UIImage? = UIImage(named: "xmark.circle") {
        didSet {
            self.btnOL.setImage(imageBtn, for: .normal)
        }
    }
    
    var textValue: String {
        return textFieldOL.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
        self.setUp()
        self.setupHoverGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadView()
        self.setUp()
        self.setupHoverGesture()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func loadView() {
        let bundle = Bundle(for: type(of: self))
        let className = String(describing: type(of: self))
        if let uiView = bundle.loadNibNamed(className, owner: self, options: nil)?.first as? UIView {
            uiView.frame = self.bounds
            self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(uiView)
        }
    }
    
    private func setUp(){
        self.textFieldOL.delegate = self
        self.btnOL.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidBeginEditing(_:)), name: UITextField.textDidBeginEditingNotification, object: textFieldOL)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidEndEditing(_:)), name: UITextField.textDidEndEditingNotification, object: textFieldOL)
    }
    private func setupHoverGesture() {
        if #available(iOS 13.4, *) {
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
            longPress.minimumPressDuration = 0
            self.btnOL.addGestureRecognizer(longPress)
        }
    }
    @objc private func handleLongPress(_ gesture: UIHoverGestureRecognizer) {
        if self.isSecureTextEntry {
            switch gesture.state {
            case .began, .changed:
                self.textFieldOL.isSecureTextEntry = false
            case .ended, .cancelled:
                self.textFieldOL.isSecureTextEntry = true
            default:
                break
            }
        }else {
            switch gesture.state {
            case .began:
                self.delegate?.inputBorderBackTap(self,textField: self.textFieldOL)
            default:
                break
            }
            
        }
    }
    
    @objc private func handleTextDidBeginEditing(_ notification: Notification) {
        self.btnOL.isHidden = false
        self.inputViewOL.layer.borderWidth = 1
        self.inputViewOL.layer.borderColor = UIColor.white.cgColor
        self.delegate?.inputBorderDidBeginEditing(self, textField:self.textFieldOL)
    }
    
    @objc private func handleTextDidEndEditing(_ notification: Notification){
        self.btnOL.isHidden = true
        self.inputViewOL.layer.borderWidth = 0
        self.inputViewOL.layer.borderColor = nil
        self.delegate?.inputBorderDidEndEditing(self, textField:self.textFieldOL)
        
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
}

extension InputBorder: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
