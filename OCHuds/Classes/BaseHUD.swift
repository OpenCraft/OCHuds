//
//  BaseHUD.swift
//  OCHud
//
//  Created by Henrique Morbin on 07/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

open class BaseHUD {
    
    fileprivate static var instance: HudView?
    fileprivate static var isHiding = false
    
    internal class func customHud(withViewController viewController: UIViewController) -> HudView? {
        return nil
    }
    
    @discardableResult
    open static func show() -> Bool {
        if instance != nil {
            return false
        }
        
        guard let topMostViewController = topMostViewController else {
            return false
        }
        
        guard let hudView = customHud(withViewController: topMostViewController) else {
            return false
        }
        
        instance = hudView
        instance?.show()
        
        return true
    }
    
    @discardableResult
    open static func show(withDelay seconds: Double) -> Bool {
        let result = show()
        
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time) { _ in
            hide()
        }
        return result
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
