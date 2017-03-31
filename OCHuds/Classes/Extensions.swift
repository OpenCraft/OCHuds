//
//  Extensions.swift
//  Pods
//
//  Created by Henrique Morbin on 31/03/17.
//
//

import Foundation

internal extension UIView {
    
    internal func fillSuperview() {
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
}
