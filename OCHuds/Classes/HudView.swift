//
//  HudView.swift
//  OCHud
//
//  Created by Henrique Morbin on 07/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import OCExtensions

internal class HudView: UIView {
    
    var viewController: UIViewController
    var centerView: UIView
    
    init(withViewController viewController: UIViewController, viewSize: CGSize?) {
        self.viewController = viewController
        self.centerView = HudView.instantiateCenterView()
        
        super.init(frame: CGRect.zero)
        
        addSubview(centerView)
        centerView.centerSuperview(withSize: CGSize(width: viewSize?.width ?? 80, height: viewSize?.height ?? 80))
        backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func instantiateCenterView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        
        let margin = 5
        let myBezier = UIBezierPath()
        myBezier.moveToPoint(CGPoint(x: -margin, y: -margin))
        myBezier.addLineToPoint(CGPoint(x: 80 + margin, y: -margin))
        myBezier.addLineToPoint(CGPoint(x: 80 + margin, y: 80 + margin))
        myBezier.addLineToPoint(CGPoint(x: -margin, y: 80 + margin))
        myBezier.closePath()
        
        view.layer.shadowPath = myBezier.CGPath
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSizeMake(0, 0)
        view.layer.shadowRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 10
        return view
    }
    
    func show() {
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        viewController.view.addSubview(self)
        fillSuperview()
    }
    
    func hide() {
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
        
        removeFromSuperview()
    }
}