//
//  ViewController.swift
//  OCHud
//
//  Created by Henrique Morbin on 08/06/2016.
//  Copyright (c) 2016 Henrique Morbin. All rights reserved.
//

import UIKit
import OCHuds

class ViewController: UIViewController {
    
    // MARK: Actions
    
    @IBAction func btnShowTouched(_ sender: AnyObject) {
        SpinnerHUD.show(withDelay: 3.0)
    }
    
    @IBAction func btnHideTouched(_ sender: AnyObject) {
        SpinnerHUD.hide()
    }
    
    @IBAction func btnShowAnimatedTouch(_ sender: AnyObject) {
        AnimatedHUD.show(withImages: getImages(), backgroundColor: UIColor.white, animationDuration: 1.0)
    }
    
    @IBAction func btnShowSuccessMessage(_ sender: AnyObject) {
        MessageHUD.showSuccess()
    }
    
    @IBAction func btnShowFailureMessage(_ sender: AnyObject) {
        MessageHUD.showFailure()
    }
    
    @IBAction func btnShowWarningMessage(_ sender: AnyObject) {
        MessageHUD.showWarning(withMessage: "Warning!")
    }
    
    fileprivate final func getImages() -> [UIImage] {
        var images: [UIImage] = [] 
        
        for index in 1...4 {
            images.append(UIImage(named: "\(index)")!)
        }
        
        return images
    }
}
