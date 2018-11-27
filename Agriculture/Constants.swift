//
//  Constants.swift
//  Agriculture
//
//  Created by Wipro on 24/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import Foundation
import UIKit

let IS_IPAD = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad ? true:false

var menuItems : [String] = ["Home", "New Insurance", "Existing Insurance", "Claim Initiation", "My Documents", "Refund of Claim", "Product Information", "Check Eligibility"]

var arrQuestions = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit?","Aliquam mollis tortor a tempor congue?","Nam eget metus non leo faucibus commodo vel ac diam?","Vestibulum nec sem eget arcu molestie consectetur in id ante?","In in orci finibus, ultricies enim ut, accumsan sem?"]

//MARK: dismiss keyboard on background tap
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
