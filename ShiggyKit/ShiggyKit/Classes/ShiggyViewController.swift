//
//  ShiggyViewController.swift
//  ShiggyKit
//
//  Created by Lee, Jeongsik on 2019/06/11.
//  Copyright © 2019 Lee, Jeongsik. All rights reserved.
//

import UIKit

public struct ShiggyViewController {
    
    public let vc: UIViewController
    
    public typealias AlertButtonActionFuction = () -> ()
    public typealias Completion = AlertButtonActionFuction
    
    init(vc: UIViewController) {
        self.vc = vc
    }
    
    /**
     Shows an alert with one customized button on the view controller.
     The completion handler of presenting the alert is set to be nil.
     - Parameters:
         - title: The title of the alert.
         - message: The message of the alert.
         - firstButtonTitle: The title of the first button.
         - firstButtonAction: The action of the first button.
         - firstButtonStyle: The action style of the first button.
     */
    public func showAlertWithOneButton(title: String,
                                       message: String,
                                       firstButtonTitle: String,
                                       firstButtonAction: @escaping AlertButtonActionFuction,
                                       firstButtonStyle: UIAlertAction.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler: { _ in
            firstButtonAction()
        }))
        self.vc.present(alert, animated: true, completion: nil)
    }
    
    /**
     Shows an alert with one customized button on the view controller.
     - Parameters:
         - title: The title of the alert.
         - message: The message of the alert.
         - firstButtonTitle: The title of the first button.
         - firstButtonAction: The action of the first button.
         - firstButtonStyle: The action style of the first button.
         - completion: The block to execute after the presentation finishes.
     */
    public func showAlertWithOneButton(title: String,
                                       message: String,
                                       firstButtonTitle: String,
                                       firstButtonAction: @escaping AlertButtonActionFuction,
                                       firstButtonStyle: UIAlertAction.Style,
                                       completion: @escaping Completion) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler: { _ in
            firstButtonAction()
        }))
        self.vc.present(alert, animated: true, completion: completion)
    }
    
    /**
     Shows an alert with two customized buttons on the view controller.
     The completion handler of presenting the alert is set to be nil.
     - Parameters:
         - title: The title of the alert.
         - message: The message of the alert.
         - firstButtonTitle: The title of the first button.
         - firstButtonAction: The action of the first button.
         - firstButtonStyle: The action style of the first button.
         - secondButtonTitle: The title of the second button.
         - secondButtonAction: The action of the second button.
         - secondButtonStyle: The action style of the second button.
     */
    public func showAlertWithTwoButtons(title: String,
                                        message: String,
                                        firstButtonTitle: String,
                                        firstButtonAction: @escaping AlertButtonActionFuction,
                                        firstButtonStyle: UIAlertAction.Style,
                                        secondButtonTitle: String,
                                        secondButtonAction: @escaping AlertButtonActionFuction,
                                        secondButtonStyle: UIAlertAction.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler: { _ in
            firstButtonAction()
        }))
        alert.addAction(UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler: { _ in
            secondButtonAction()
        }))
        self.vc.present(alert, animated: true, completion: nil)
    }
    
    /**
     Shows an alert with two customized buttons on the view controller.
     - Parameters:
         - title: The title of the alert.
         - message: The message of the alert.
         - firstButtonTitle: The title of the first button.
         - firstButtonAction: The action of the first button.
         - firstButtonStyle: The action style of the first button.
         - secondButtonTitle: The title of the second button.
         - secondButtonAction: The action of the second button.
         - secondButtonStyle: The action style of the second button.
         - completion: The block to execute after the presentation finishes.
     */
    public func showAlertWithTwoButtons(title: String,
                                        message: String,
                                        firstButtonTitle: String,
                                        firstButtonAction: @escaping AlertButtonActionFuction,
                                        firstButtonStyle: UIAlertAction.Style,
                                        secondButtonTitle: String,
                                        secondButtonAction: @escaping AlertButtonActionFuction,
                                        secondButtonStyle: UIAlertAction.Style,
                                        completion: @escaping Completion) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler: { _ in
            firstButtonAction()
        }))
        alert.addAction(UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler: { _ in
            secondButtonAction()
        }))
        self.vc.present(alert, animated: true, completion: completion)
    }
    
    /**
     Shows an alert with three customized buttons on the view controller.
     The completion handler of presenting the alert is set to be nil.
     - Parameters:
         - title: The title of the alert.
         - message: The message of the alert.
         - firstButtonTitle: The title of the first button.
         - firstButtonAction: The action of the first button.
         - firstButtonStyle: The action style of the first button.
         - secondButtonTitle: The title of the second button.
         - secondButtonAction: The action of the second button.
         - secondButtonStyle: The action style of the second button.
         - thirdButtonTitle: The title of the third button.
         - thirdButtonAction: The action of the third button.
         - thirdButtonStyle: The action style of the third button.
     */
    public func showAlertWithThreeButtons(title: String,
                                          message: String,
                                          firstButtonTitle: String,
                                          firstButtonAction: @escaping AlertButtonActionFuction,
                                          firstButtonStyle: UIAlertAction.Style,
                                          secondButtonTitle: String,
                                          secondButtonAction: @escaping AlertButtonActionFuction,
                                          secondButtonStyle: UIAlertAction.Style,
                                          thirdButtonTitle: String,
                                          thirdButtonAction: @escaping AlertButtonActionFuction,
                                          thirdButtonStyle: UIAlertAction.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler: { _ in
            firstButtonAction()
        }))
        alert.addAction(UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler: { _ in
            secondButtonAction()
        }))
        alert.addAction(UIAlertAction(title: thirdButtonTitle, style: thirdButtonStyle, handler: { _ in
            thirdButtonAction()
        }))
        self.vc.present(alert, animated: true, completion: nil)
    }
    
    /**
     Shows an alert with three customized buttons on the view controller.
     - Parameters:
         - title: The title of the alert.
         - message: The message of the alert.
         - firstButtonTitle: The title of the first button.
         - firstButtonAction: The action of the first button.
         - firstButtonStyle: The action style of the first button.
         - secondButtonTitle: The title of the second button.
         - secondButtonAction: The action of the second button.
         - secondButtonStyle: The action style of the second button.
         - thirdButtonTitle: The title of the third button.
         - thirdButtonAction: The action of the third button.
         - thirdButtonStyle: The action style of the third button.
         - completion: The block to execute after the presentation finishes.
     */
    public func showAlertWithThreeButtons(title: String,
                                          message: String,
                                          firstButtonTitle: String,
                                          firstButtonAction: @escaping AlertButtonActionFuction,
                                          firstButtonStyle: UIAlertAction.Style,
                                          secondButtonTitle: String,
                                          secondButtonAction: @escaping AlertButtonActionFuction,
                                          secondButtonStyle: UIAlertAction.Style,
                                          thirdButtonTitle: String,
                                          thirdButtonAction: @escaping AlertButtonActionFuction,
                                          thirdButtonStyle: UIAlertAction.Style,
                                          completion: @escaping Completion) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler: { _ in
            firstButtonAction()
        }))
        alert.addAction(UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler: { _ in
            secondButtonAction()
        }))
        alert.addAction(UIAlertAction(title: thirdButtonTitle, style: thirdButtonStyle, handler: { _ in
            thirdButtonAction()
        }))
        self.vc.present(alert, animated: true, completion: completion)
    }
    
}
