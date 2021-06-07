//
//  UIViewController.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/07.
//

import UIKit
extension UIViewController {
    func showBasicAlert(alertTitle : String, alertMessage : String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
