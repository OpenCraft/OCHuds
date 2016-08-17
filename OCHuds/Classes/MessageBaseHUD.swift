//
//  MessageBaseHUD.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 17/08/16.
//
//

import UIKit

enum Status {
    case Success
    case Failure
    case Warning
    case Regular
}

public class MessageBaseHUD {
    
    private static var instance: HudView?
    private static var isHiding = false
    
    private static let animationDuration = 2.0
    
    internal class func customHud(withViewController viewController: UIViewController, status: Status, message: String?, backgroundColor: UIColor, customImage: UIImage?) -> HudView? {
        return nil
    }
    
    private static func show(withStatus status: Status, message: String?, customImage: UIImage? = nil) -> Bool {
        if instance != nil {
            return false
        }
        
        guard let topMostViewController = topMostViewController else {
            return false
        }
        
        guard let hudView = customHud(withViewController: topMostViewController, status: status, message: message, backgroundColor: UIColor.whiteColor(), customImage: customImage) else {
            return false
        }
        
        instance = hudView
        instance?.show()
        
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(animationDuration * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) { _ in
            hide()
        }
        
        return true
    }
    
    public static func showSuccess(withMessage message: String? = "Success") {
        show(withStatus: .Success, message: message)
    }
    
    public static func showFailure(withMessage message: String? = "Failure") {
        show(withStatus: .Failure, message: message)
    }
    
    public static func showWarning(withMessage message: String) {
        show(withStatus: .Warning, message: message)
    }
    
    public static func show(withCustomImage image: UIImage, message: String) {
        show(withStatus: .Regular, message: message, customImage: image)
    }
    
    public static func showMessage(message: String) {
        show(withStatus: .Regular, message: message)
    }
    
    public static func hide() -> Bool {
        guard let instance = instance else {
            return false
        }
        
        guard isHiding == false else {
            return false
        }
        
        isHiding = true
        
        if NSThread.currentThread().isMainThread {
            instance.hide()
        } else {
            dispatch_async(dispatch_get_main_queue()) {
                instance.hide()
            }
        }
        
        isHiding = false
        self.instance = nil
        
        return true
    }
    
}
