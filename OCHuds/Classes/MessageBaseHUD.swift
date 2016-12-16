//
//  MessageBaseHUD.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 17/08/16.
//
//

import UIKit

enum Status {
    case success
    case failure
    case warning
    case regular
}

open class MessageBaseHUD {
    
    fileprivate static var instance: HudView?
    fileprivate static var isHiding = false
    
    fileprivate static let animationDuration = 2.0
    
    internal class func customHud(withViewController viewController: UIViewController, status: Status, message: String?, backgroundColor: UIColor, customImage: UIImage?) -> HudView? {
        return nil
    }
    
    @discardableResult
    fileprivate static func show(withStatus status: Status, message: String?, customImage: UIImage? = nil) -> Bool {
        if instance != nil {
            return false
        }
        
        guard let topMostViewController = topMostViewController else {
            return false
        }
        
        guard let hudView = customHud(withViewController: topMostViewController, status: status, message: message, backgroundColor: UIColor.white, customImage: customImage) else {
            return false
        }
        
        instance = hudView
        instance?.show()
        
        let time = DispatchTime.now() + Double(Int64(animationDuration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time) { _ in
            hide()
        }
        
        return true
    }
    
    open static func showSuccess(withMessage message: String? = "Success") {
        show(withStatus: .success, message: message)
    }
    
    open static func showFailure(withMessage message: String? = "Failure") {
        show(withStatus: .failure, message: message)
    }
    
    open static func showWarning(withMessage message: String) {
        show(withStatus: .warning, message: message)
    }
    
    open static func show(withCustomImage image: UIImage, message: String) {
        show(withStatus: .regular, message: message, customImage: image)
    }
    
    open static func showMessage(_ message: String) {
        show(withStatus: .regular, message: message)
    }
    
    @discardableResult
    open static func hide() -> Bool {
        guard let instance = instance else {
            return false
        }
        
        guard isHiding == false else {
            return false
        }
        
        isHiding = true
        
        if Thread.current.isMainThread {
            instance.hide()
        } else {
            DispatchQueue.main.async {
                instance.hide()
            }
        }
        
        isHiding = false
        self.instance = nil
        
        return true
    }
    
}
