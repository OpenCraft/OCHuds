//
//  LayerViewExtension.swift
//  Pods
//
//  Created by Henrique Morbin on 03/08/16.
//
//

import UIKit

public extension UIView {
    
    @IBInspectable public  var corner: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable public  var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public  var borderColor: UIColor {
        get {
            return UIColor(CGColor: layer.borderColor ?? UIColor.clearColor().CGColor)
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
    
}