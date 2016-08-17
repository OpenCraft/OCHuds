//
//  SpinnerHUD.swift
//  OCHud
//
//  Created by Henrique Morbin on 06/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public class SpinnerHUD: BaseHUD {
    internal override class func customHud(withViewController viewController: UIViewController) -> HudView? {
        return SpinnerView(withViewController: viewController)
    }
}

// TODO: Change to OCExtensions
internal var topMostViewController: UIViewController? {
    var topMost = UIApplication.sharedApplication().keyWindow?.rootViewController
    while let presented = topMost?.presentedViewController {
        topMost = presented
    }
    
    return topMost
}

// TODO: Change to OCExtensions
internal extension UIView {
    func centerSuperview(withSize size: CGSize, constantX: CGFloat = 0, constantY: CGFloat = 0) {
        if let superview = self.superview {
            let subview = self
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .CenterX, relatedBy: .Equal, toItem: superview, attribute: .CenterX, multiplier: 1, constant: constantX))
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .CenterY, relatedBy: .Equal, toItem: superview, attribute: .CenterY, multiplier: 1, constant: constantY))
            subview.addConstraint(NSLayoutConstraint(item: subview, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size.width))
            subview.addConstraint(NSLayoutConstraint(item: subview, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size.height))
        }
    }
    
    func baseSuperview(withSize size: CGSize) {
        if let superview = self.superview {
            let subview = self
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .CenterX, relatedBy: .Equal, toItem: superview, attribute: .CenterX, multiplier: 1, constant: 0))
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .Bottom, relatedBy: .Equal, toItem: superview, attribute: .Bottom, multiplier: 1, constant: -10))
            subview.addConstraint(NSLayoutConstraint(item: subview, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size.width))
            subview.addConstraint(NSLayoutConstraint(item: subview, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size.height))
        }
    }
}
