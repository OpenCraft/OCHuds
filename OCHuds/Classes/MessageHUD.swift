//
//  MessageHUD.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 17/08/16.
//
//

import UIKit

open class MessageHUD: MessageBaseHUD {
    internal override class func customHud(withViewController viewController: UIViewController, status: Status, message: String?, backgroundColor: UIColor, customImage: UIImage?) -> HudView {
        return MessageView(withViewController: viewController, status: status, message: message, backgroundColor: backgroundColor, customImage: customImage)
    }
}
