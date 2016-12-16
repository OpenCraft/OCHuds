//
//  SpinnerHUD.swift
//  OCHud
//
//  Created by Henrique Morbin on 06/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

open class SpinnerHUD: BaseHUD {
    internal override class func customHud(withViewController viewController: UIViewController) -> HudView? {
        return SpinnerView(withViewController: viewController)
    }
}

// TODO: Change to OCExtensions
internal var topMostViewController: UIViewController? {
    var topMost = UIApplication.shared.keyWindow?.rootViewController
    while let presented = topMost?.presentedViewController {
        topMost = presented
    }
    
    return topMost
}

// TODO: Change to OCExtensions
internal extension UIView {
    func centerSuperview(withSize size: CGSize, verticalMargin: CGFloat = 0, horizontalMargin: CGFloat = 0) {
        if let superview = self.superview {
            let subview = self
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: verticalMargin))
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: horizontalMargin))
            subview.addConstraint(NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.width))
            subview.addConstraint(NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.height))
        }
    }
    
    func baseSuperview(withSize size: CGSize) {
        if let superview = self.superview {
            let subview = self
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0))
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: -10))
            subview.addConstraint(NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.width))
            subview.addConstraint(NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.height))
        }
    }
}
