//
//  GeneralViewExtension.swift
//  Pods
//
//  Created by Henrique Morbin on 03/08/16.
//
//

import UIKit

public extension UIView {
    
    public static func loadFromNibNamed(nibNamed: String, bundle: NSBundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    public func fillSuperview() {
        if let superview = self.superview {
            let subview = self
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .Top, relatedBy: .Equal, toItem: superview, attribute: .Top,
                multiplier: 1.0, constant: 0.0))
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .Leading, relatedBy: .Equal, toItem: superview, attribute: .Leading,
                multiplier: 1.0, constant: 0.0))
            superview.addConstraint(NSLayoutConstraint(item: superview, attribute: .Bottom, relatedBy: .Equal, toItem: subview, attribute: .Bottom,
                multiplier: 1.0, constant: 0.0))
            superview.addConstraint(NSLayoutConstraint(item: superview, attribute: .Trailing, relatedBy: .Equal, toItem: subview, attribute: .Trailing,
                multiplier: 1.0, constant: 0.0))
        }
    }
    
    public func fill(inSuperview superview: UIView) {
        if superview.subviews.indexOf(self) == nil {
            superview.addSubview(self)
        }
        
        self.fillSuperview()
    }
    
}
