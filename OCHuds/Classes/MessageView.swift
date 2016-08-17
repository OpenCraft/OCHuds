//
//  MessageView.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 17/08/16.
//
//

import UIKit

internal class MessageView: HudView {
    
    var imageView = UIImageView()
    
    init(withViewController viewController: UIViewController, status: Status, message: String?, backgroundColor: UIColor, customImage: UIImage?) {
        super.init(withViewController: viewController, viewSize: CGSize(width: 140, height: 100), hudBackgroundColor: backgroundColor)
        
        if let customImage = customImage {
            imageView.image = customImage
        } else {
            imageView.image = getImage(fromStatus: status)
        }
        
        centerView.addSubview(imageView)
        imageView.centerSuperview(withSize: CGSize(width: 35, height: 35), constantY: -10)
        imageView.backgroundColor = UIColor.clearColor()
        imageView.contentMode = .ScaleAspectFit
        
        let label = UILabel()
        centerView.addSubview(label)
        label.baseSuperview(withSize: CGSize(width: 80, height: 20))
        label.textAlignment = .Center
        label.textColor = UIColor.blackColor()
        label.minimumScaleFactor = 8.0
        label.font = label.font.fontWithSize(12.0)
        
        if let message = message {
            label.text = message
        } else {
            label.text = getMessageTextBasedOnStatus(status)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private final func getImage(fromStatus status: Status) -> UIImage {
        switch status {
        case .Success:
            return UIImage(named: "success") ?? UIImage()
        case .Failure:
            return UIImage(named: "failure") ?? UIImage()
        case .Warning:
            return UIImage(named: "warning") ?? UIImage()
        default:
            return UIImage()
        }
    }
    
    private final func getMessageTextBasedOnStatus(status: Status) -> String {
        switch status {
        case .Success:
            return "Success"
        case .Failure:
            return "Failure"
        default:
            return ""
        }
    }
    
}

