//
//  LoadingManager.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 10/02/2025.
//

import Foundation
import UIKit

class LoadingManager {
    static let shared = LoadingManager() // Singleton

    private var overlayView: UIView?
    
    private init() {} // Ngăn chặn khởi tạo từ bên ngoài

    func showLoading(in view: UIView? = nil) {
        guard overlayView == nil else { return } // Nếu đã hiển thị thì không tạo mới

        let targetView = view ?? (UIApplication.shared.keyWindow ?? UIView())
        
        let overlay = UIView(frame: targetView.bounds)
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(red: 210/255.0, green: 31/255.0, blue: 60/255.0, alpha: 1.0)
        activityIndicator.center = overlay.center
        activityIndicator.startAnimating()
        
        overlay.addSubview(activityIndicator)
        targetView.addSubview(overlay)
        
        overlayView = overlay
    }

    func hideLoading() {
        overlayView?.removeFromSuperview()
        overlayView = nil
    }
}
