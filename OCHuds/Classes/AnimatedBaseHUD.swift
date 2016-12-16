//
//  AnimatedBaseHUD.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 16/08/16.
//
//

import UIKit

open class AnimatedBaseHUD {
    
    fileprivate static var instance: HudView?
    fileprivate static var isHiding = false
    
    fileprivate static let animationDuration = 2.0
    
    internal class func customHud(withViewController viewController: UIViewController, images: [UIImage], backgroundColor: UIColor, animationDuration: Double) -> HudView? {
        return nil
    }
    
    @discardableResult
    open static func show(withImages images: [UIImage], backgroundColor: UIColor = UIColor.white, animationDuration: Double = animationDuration) -> Bool {
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
