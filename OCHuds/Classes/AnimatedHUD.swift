//
//  AnimatedHUD.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 16/08/16.
//
//

import UIKit

public class AnimatedHUD: AnimatedBaseHUD {
    internal override class func customHud(withViewController viewController: UIViewController, images: [UIImage], backgroundColor: UIColor, animationDuration: Double) -> HudView? {
        return AnimatedView(withViewController: viewController, images: images, backgroundColor: backgroundColor, animationDuration: animationDuration)
    }
}
