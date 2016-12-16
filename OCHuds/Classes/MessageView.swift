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
        imageView.centerSuperview(withSize: CGSize(width: 35, height: 35), horizontalMargin: -10)
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        centerView.addSubview(label)
        label.baseSuperview(withSize: CGSize(width: 80, height: 20))
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.minimumScaleFactor = 8.0
        label.font = label.font.withSize(12.0)
        
        if let message = message {
            label.text = message
        } else {
            label.text = getMessageTextBasedOnStatus(status)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate final func getImage(fromStatus status: Status) -> UIImage {
        switch status {
        case .success:
            return UIImage(named: "success") ?? UIImage()
        case .failure:
            return UIImage(named: "failure") ?? UIImage()
        case .warning:
            return UIImage(named: "warning") ?? UIImage()
        case .regular:
            return UIImage()
        }
    }
    
    fileprivate final func getMessageTextBasedOnStatus(_ status: Status) -> String {
        switch status {
        case .success:
            return "Success"
        case .failure:
            return "Failure"
        default:
            return ""
        }
    }
    
}

