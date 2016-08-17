//
//  AnimatedView.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 16/08/16.
//
//

import UIKit

internal class AnimatedView: HudView {
    
    var imageView: UIImageView
    var images: [UIImage] = []
    
    init(withViewController viewController: UIViewController, images: [UIImage], backgroundColor: UIColor, animationDuration: Double) {
        self.imageView = UIImageView()
        imageView.animationDuration = animationDuration
        imageView.animationImages = images
        
        super.init(withViewController: viewController)
        
        centerView.addSubview(imageView)
        centerView.backgroundColor = backgroundColor
        imageView.centerSuperview(withSize: CGSize(width: 40, height: 40))
        imageView.backgroundColor = UIColor.clearColor()
        imageView.contentMode = .ScaleAspectFit
        imageView.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
