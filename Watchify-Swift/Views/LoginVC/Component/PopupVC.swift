//
//  PopupVC.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 10/02/2025.
//

import UIKit

class PopupVC: UIViewController {
    @IBOutlet var overlayOL: UIView!
    @IBOutlet weak var contentViewOL: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(overlayTapHandle(_:)))
        
        self.overlayOL.addGestureRecognizer(tapGesture)
    }
    
    @objc private func overlayTapHandle(_ gesture: UITapGestureRecognizer){
        let location = gesture.location(in: self.overlayOL)
        if !self.contentViewOL.frame.contains(location){
            self.dismiss(animated: true)
        }
    }
    @IBAction func actionConfirmHandle(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
