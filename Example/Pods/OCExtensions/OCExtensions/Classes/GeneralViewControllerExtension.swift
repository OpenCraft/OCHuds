//
//  GeneralViewControllerExtension.swift
//  Pods
//
//  Created by Henrique Morbin on 03/08/16.
//
//

import UIKit

public extension UIViewController {
    
    public func showAlert(message: String, title: String? = nil, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: okHandler))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    public func addChildViewController(viewController: UIViewController, inContainerView container: UIView) {
        addChildViewController(viewController)
        viewController.view.fill(inSuperview: container)
    }
    
}