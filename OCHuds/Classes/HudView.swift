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
    
    init(withViewController viewController: UIViewController, viewSize: CGSize = CGSizeMake(80, 80), hudBackgroundColor: UIColor = UIColor.blackColor()) {
        self.viewController = viewController
        self.centerView = HudView.instantiateCenterView(withBackground: hudBackgroundColor, viewSize: viewSize)
        
        super.init(frame: CGRect.zero)
        
        addSubview(centerView)
        centerView.centerSuperview(withSize: CGSize(width: viewSize.width, height: viewSize.height))
        backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func instantiateCenterView(withBackground backgroundColor: UIColor, viewSize: CGSize) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor.colorWithAlphaComponent(1.0)
        
        let margin: CGFloat = 5.0
        let myBezier = UIBezierPath()
        myBezier.moveToPoint(CGPoint(x: -margin, y: -margin))
        myBezier.addLineToPoint(CGPoint(x: viewSize.width + margin, y: -margin))
        myBezier.addLineToPoint(CGPoint(x: viewSize.width + margin, y: viewSize.height + margin))
        myBezier.addLineToPoint(CGPoint(x: -margin, y: viewSize.height + margin))
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
        
        UIView.transitionWithView(viewController.view, duration: 0.6, options: UIViewAnimationOptions.TransitionCrossDissolve,
                                  animations: {self.viewController.view.addSubview(self)}, completion: nil)
        fillSuperview()
    }
    
    func hide() {
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
        
        UIView.transitionWithView(self, duration: 0.6, options: .TransitionCrossDissolve, animations: { 
                self.centerView.alpha = 0.0
                self.centerView.removeFromSuperview()
            }) { _ in
                self.removeFromSuperview()
        }
    }
}