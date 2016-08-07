//
//  BaseHUD.swift
//  OCHud
//
//  Created by Henrique Morbin on 07/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public class BaseHUD {
    
    private static var instance: HudView?
    private static var isHiding = false
    
    internal class func customHud(withViewController viewController: UIViewController) -> HudView? {
        return nil
    }
    
    public static func show() -> Bool {
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
    
    public static func show(withDelay seconds: Double) -> Bool {
        let result = show()
        
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) { _ in
            hide()
        }
        return result
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