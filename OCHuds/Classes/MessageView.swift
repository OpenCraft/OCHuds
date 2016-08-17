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
    
    init(withViewController viewController: UIViewController, status: Status) {
        super.init(withViewController: viewController, viewSize: CGSize(width: 140, height: 100))
        
        imageView.image = getImage(fromStatus: status)
        
        centerView.addSubview(imageView)
        imageView.centerSuperview(withSize: CGSize(width: 20, height: 20))
        imageView.backgroundColor = UIColor.clearColor()
        imageView.contentMode = .ScaleAspectFit
        
        let label = UILabel()
        centerView.addSubview(label)
        label.baseSuperview(withSize: CGSize(width: 40, height: 15))
        label.text = "teste"
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "System", size: 8.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private final func getImage(fromStatus status: Status) -> UIImage {
        switch status {
        case .Success:
            return UIImage(named: "1") ?? UIImage()
        case .Failure:
            return UIImage(named: "2") ?? UIImage()
        case .Warning:
            return UIImage(named: "3") ?? UIImage()
        case .Regular:
            return UIImage(named: "4") ?? UIImage()
        }
    }
    
}

