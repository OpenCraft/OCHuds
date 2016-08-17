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
    
    @IBAction func btnShowTouched(sender: AnyObject) {
        SpinnerHUD.show(withDelay: 3.0)
    }
    
    @IBAction func btnHideTouched(sender: AnyObject) {
        SpinnerHUD.hide()
    }
    
    @IBAction func btnShowAnimatedTouch(sender: AnyObject) {
        AnimatedHUD.show(withImages: getImages(), backgroundColor: UIColor.whiteColor(), animationDuration: 1.0)
    }
    
    @IBAction func btnShowSuccessMessage(sender: AnyObject) {
        MessageHUD.showSuccess()
    }
    
    @IBAction func btnShowFailureMessage(sender: AnyObject) {
        MessageHUD.showFailure()
    }
    
    @IBAction func btnShowWarningMessage(sender: AnyObject) {
        MessageHUD.showWarning(withMessage: "Aviso!")
    }
    
    private final func getImages() -> [UIImage] {
        var images: [UIImage] = [] 
        
        for index in 1...4 {
            images.append(UIImage(named: "\(index)")!)
        }
        
        return images
    }
}
