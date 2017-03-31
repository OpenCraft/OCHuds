//
//  HudView.swift
//  OCHud
//
//  Created by Henrique Morbin on 07/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

internal class HudView: UIView {
    
    var viewController: UIViewController
    var centerView: UIView
    
    init(withViewController viewController: UIViewController, viewSize: CGSize = CGSize(width: 80, height: 80), hudBackgroundColor: UIColor = UIColor.black) {
        self.viewController = viewController
        self.centerView = HudView.instantiateCenterView(withBackground: hudBackgroundColor, viewSize: viewSize)
        
        super.init(frame: CGRect.zero)
        
        addSubview(centerView)
        centerView.centerSuperview(withSize: CGSize(width: viewSize.width, height: viewSize.height))
        backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate static func instantiateCenterView(withBackground backgroundColor: UIColor, viewSize: CGSize) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor.withAlphaComponent(1.0)
        
        let margin: CGFloat = 5.0
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: -margin, y: -margin))
        myBezier.addLine(to: CGPoint(x: viewSize.width + margin, y: -margin))
        myBezier.addLine(to: CGPoint(x: viewSize.width + margin, y: viewSize.height + margin))
        myBezier.addLine(to: CGPoint(x: -margin, y: viewSize.height + margin))
        myBezier.close()
        
        view.layer.shadowPath = myBezier.cgPath
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 10
        return view
    }

    func show() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        UIView.transition(with: viewController.view, duration: 0.6, options: UIViewAnimationOptions.transitionCrossDissolve,
                                  animations: {self.viewController.view.addSubview(self)}, completion: nil)
        fillSuperview()
    }
    
    func hide() {
        UIApplication.shared.endIgnoringInteractionEvents()
        
        UIView.transition(with: self, duration: 0.6, options: .transitionCrossDissolve, animations: { 
                self.centerView.alpha = 0.0
                self.centerView.removeFromSuperview()
            }) { _ in
                self.removeFromSuperview()
        }
    }
}
