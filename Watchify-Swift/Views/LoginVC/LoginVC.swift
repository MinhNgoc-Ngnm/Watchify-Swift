//
//  LoginVC.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 08/02/2025.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var actionBarOL: DefaultActionBar!
    
    @IBOutlet weak var userNameOL: InputBorder!
    
    @IBOutlet weak var passWorldOL: InputBorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionBarOL.onBack = { self.navigationController?.popViewController(animated: true) }
        self.setUpTextField()
    }
    private func setUpTextField(){
        self.userNameOL.delegate = self
        self.passWorldOL.delegate = self
    }
    @IBAction func popUpTapHandle(_ sender: UIButton) {
        let popupVC = PopupVC()
        popupVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen;
        self.present(popupVC, animated: true)
    }
    @IBAction func submitTaphandle(_ sender: UIButton) {
        LoadingManager.shared.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            LoadingManager.shared.hideLoading()
            let homeVC = HomeVC()
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}


extension LoginVC: InputBorderDelegate {
    func inputBorderBackTap(_ inputBorder: InputBorder, textField: UITextField) {
        switch inputBorder{
        case self.userNameOL:
            inputBorder.textFieldOL.text = ""
            return
        default:
            return
        }
    }
    
    func inputBorderDidBeginEditing(_ inputBorder: InputBorder, textField: UITextField) {
        
    }
    
    func inputBorderDidEndEditing(_ inputBorder: InputBorder, textField: UITextField) {
        
    }
    
    
}
