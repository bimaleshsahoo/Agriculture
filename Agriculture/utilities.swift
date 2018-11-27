//
//  utilities.swift
//  Agriculture
//
//  Created by Bimalesh Sahoo on 26/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class utilities {
    //Alert without Action
    static func displayAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("keyWindow has no rootViewController")
            
        }
        viewController.present(alertController, animated: true, completion: nil)
    }

    //Alert for Logout
    static func logoutAlert(controller: UIViewController) {
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("keyWindow has no rootViewController")
            
        }
        let logoutAlert = UIAlertController(title: "Log Out", message: "Are You Sure to Log Out ? ", preferredStyle: UIAlertController.Style.alert)
        
        logoutAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let loginController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            controller.navigationController?.viewControllers.removeAll()
            
            appDelegate.window?.rootViewController = loginController
            appDelegate.window?.makeKeyAndVisible()
            
        }))
        
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            logoutAlert .dismiss(animated: true, completion: nil)
        }))
        
        viewController.present(logoutAlert, animated: true, completion: nil)
    }
}
