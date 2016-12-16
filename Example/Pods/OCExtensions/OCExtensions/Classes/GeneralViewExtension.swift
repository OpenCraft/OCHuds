//
//  GeneralViewExtension.swift
//  Pods
//
//  Created by Henrique Morbin on 03/08/16.
//
//

import UIKit

public extension UIView {
    
    public static func loadFromNibNamed(_ nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    public func fillSuperview() {
        if let superview = self.superview {
            let subview = self
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top,
                multiplier: 1.0, constant: 0.0))
            superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading,
                multiplier: 1.0, constant: 0.0))
            superview.addConstraint(NSLayoutConstraint(item: superview, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom,
                multiplier: 1.0, constant: 0.0))
            superview.addConstraint(NSLayoutConstraint(item: superview, attribute: .trailing, relatedBy: .equal, toItem: subview, attribute: .trailing,
                multiplier: 1.0, constant: 0.0))
        }
    }
    
    public func fill(inSuperview superview: UIView) {
        if superview.subviews.index(of: self) == nil {
            superview.addSubview(self)
        }
        
        self.fillSuperview()
    }
    
}
