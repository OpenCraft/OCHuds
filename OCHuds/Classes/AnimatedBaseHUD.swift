//
//  AnimatedBaseHUD.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 16/08/16.
//
//

import UIKit

public class AnimatedBaseHUD {
    
    private static var instance: HudView?
    private static var isHiding = false
    
    internal class func customHud(withViewController viewController: UIViewController, images: [UIImage], backgroundColor: UIColor, animationDuration: Double) -> HudView? {
        return nil
    }
    
    public static func show(withImages images: [UIImage], backgroundColor: UIColor = UIColor.whiteColor(), animationDuration: Double = 2.0) -> Bool {
        if instance != nil {
            return false
        }
        
        guard let topMostViewController = topMostViewController else {
            return false
        }
        
        guard let hudView = customHud(withViewController: topMostViewController, images: images, backgroundColor: backgroundColor, animationDuration: animationDuration) else {
            return false
        }
        
        instance = hudView
        instance?.show()
        
        return true
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