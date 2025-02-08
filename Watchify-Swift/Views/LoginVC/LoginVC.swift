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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionBarOL.onBack = { self.navigationController?.popViewController(animated: true) }
    }
}
