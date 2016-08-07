//
//  BadgeViewExtension.swift
//  Pods
//
//  Created by Henrique Morbin on 03/08/16.
//
//

import UIKit

private let defaultBadgeOffset = CGPoint(x: 0, y: 0)
private let defaultBadgeSize: CGFloat = 20
private let tagIdentifier = 998877

public extension UIView {
    
    public var badgeCount: Int? {
        get {
            return self.badgeCount
        }
        set {
            guard let newValue = newValue where newValue > 0 else {
                badgeInstance.hidden = true
                return
            }
            badgeInstance.hidden = false
            badgeInstance.text = "\(newValue)"
        }
    }
    
    public var badgeSize: CGFloat? {
        get {
            return self.badgeSize
        }
        set {
            badgeInstance.updateSize(newValue ?? defaultBadgeSize)
        }
    }
    
    public var badgeOffset: CGPoint? {
        get {
            return self.badgeOffset
        }
        set {
            badgeInstance.updateOffset(newValue ?? defaultBadgeOffset)
        }
    }
    
    private var badgeInstance: UILabel {
        get {
            guard let badge = self.viewWithTag(tagIdentifier) as? UILabel else {
                let badge = UILabel(frame: CGRect(x: 0, y: 0, width: defaultBadgeSize, height: defaultBadgeSize))
                
                badge.tag = tagIdentifier
                badge.text = ""
                badge.backgroundColor = UIColor.redColor()
                badge.textColor = UIColor.whiteColor()
                badge.font = UIFont.systemFontOfSize(defaultBadgeSize/2)
                badge.textAlignment = .Center
                badge.layer.cornerRadius = defaultBadgeSize/2
                badge.layer.masksToBounds = true
                badge.adjustsFontSizeToFitWidth = true
                
                let x: CGFloat = self.frame.size.width
                let y: CGFloat = 0
                badge.center = CGPoint(x: x, y: y)
                
                addSubview(badge)
                return badge
            }
            return badge
        }
    }
}

private extension UILabel {
    func updateSize(newSize: CGFloat) {
        let center = self.center
        self.frame = CGRect(x: 0, y: 0, width: newSize, height: newSize)
        self.center = center
        self.layer.cornerRadius = newSize/2
        self.font = UIFont.systemFontOfSize(newSize/2)
    }
    
    func updateOffset(newOffset: CGPoint) {
        self.frame.offsetInPlace(dx: newOffset.x, dy: newOffset.y)
    }
}