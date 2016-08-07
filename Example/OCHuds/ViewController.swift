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
        SpinnerHUD.show(withDelay: 3)
    }
    
    @IBAction func btnHideTouched(sender: AnyObject) {
        SpinnerHUD.hide()
    }
}
