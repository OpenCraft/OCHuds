//
//  MessageHUD.swift
//  Pods
//
//  Created by Giovane Berny Possebon on 17/08/16.
//
//

import UIKit

public class MessageHUD: MessageBaseHUD {
    internal override class func customHud(withViewController viewController: UIViewController, status: Status) -> HudView {
        return MessageView(withViewController: viewController, status: status)
    }
}
