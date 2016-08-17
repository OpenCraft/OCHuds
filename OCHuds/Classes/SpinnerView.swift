//
//  SpinnerView.swift
//  OCHud
//
//  Created by Henrique Morbin on 07/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

internal class SpinnerView: HudView {
    
    var activityIndicator: UIActivityIndicatorView
    
    init(withViewController viewController: UIViewController) {
        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        
        super.init(withViewController: viewController, viewSize: CGSize(width: 80, height: 80))
        
        centerView.addSubview(activityIndicator)
        activityIndicator.centerSuperview(withSize: CGSize(width: 40, height: 40))
        activityIndicator.color = UIColor.whiteColor()
        activityIndicator.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}