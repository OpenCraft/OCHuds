//
//  GeneralViewControllerExtension.swift
//  Pods
//
//  Created by Henrique Morbin on 03/08/16.
//
//

import UIKit

public extension UIViewController {
    
    public func showAlert(_ message: String, title: String? = nil, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okHandler))
        present(alert, animated: true, completion: nil)
    }
    
    public func addChildViewController(_ viewController: UIViewController, inContainerView container: UIView) {
        addChildViewController(viewController)
        viewController.view.fill(inSuperview: container)
    }
    
}
