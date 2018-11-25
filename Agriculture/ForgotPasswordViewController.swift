//
//  ForgotPasswordViewController.swift
//  Agriculture
//
//  Created by Bimalesh Sahoo on 21/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var forgotPasswordBoxView: UIView!
    
    @IBOutlet weak var usernameBoxView: UIView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var mobileTextfield: UITextField!
    
    @IBOutlet weak var passwordBoxView: UIView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
   
    @IBOutlet weak var questionBoxView: UIView!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var answerTextfield: UITextField!
    
    @IBOutlet weak var otpBoxView: UIView!
    @IBOutlet weak var otpTextfield: UITextField!
    @IBOutlet weak var btnSendOtp: UIButton!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    @IBOutlet weak var usernamePasswordToggle: UISegmentedControl!
    @IBOutlet weak var otpToggle: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputField()
        forgotPasswordBox()
        questionBox()
        otpBox()
        
        btnSubmit.layer.cornerRadius = 6.0
        btnSubmit.layer.masksToBounds = false
        btnSubmit.layer.shadowColor = UIColor.black.cgColor
        btnSubmit.layer.shadowOffset = CGSize(width: 0,height: 2.0)
        btnSubmit.layer.shadowRadius = 2.0
        btnSubmit.layer.shadowOpacity = 1.0
        btnSubmit.layer.shadowPath = UIBezierPath(roundedRect:btnSubmit.bounds, cornerRadius:btnSubmit.layer.cornerRadius).cgPath
        
        btnSendOtp.layer.cornerRadius = 6.0
        btnSendOtp.layer.masksToBounds = false
        btnSendOtp.layer.shadowColor = UIColor.black.cgColor
        btnSendOtp.layer.shadowOffset = CGSize(width: 0,height: 2.0)
        btnSendOtp.layer.shadowRadius = 2.0
        btnSendOtp.layer.shadowOpacity = 1.0
        btnSendOtp.layer.shadowPath = UIBezierPath(roundedRect:btnSendOtp.bounds, cornerRadius:btnSendOtp.layer.cornerRadius).cgPath
        btnSendOtp.titleLabel?.adjustsFontSizeToFitWidth = true
        
        usernamePasswordToggle.layer.cornerRadius = 5.0
        usernamePasswordToggle.layer.masksToBounds = true
        
        otpToggle.layer.cornerRadius = 5.0
        otpToggle.layer.masksToBounds = true

    }
    
    func questionBox() {
        
        questionBoxView.layer.cornerRadius = 6.0
        questionBoxView.layer.masksToBounds = true
        questionBoxView.layer.borderWidth = 1.0
        questionBoxView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func otpBox() {
        
        otpBoxView.layer.cornerRadius = 6.0
        otpBoxView.layer.masksToBounds = true
        otpBoxView.layer.borderWidth = 1.0
        otpBoxView.layer.borderColor = UIColor.white.cgColor
    }
    
    func inputField() {
        
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "Enter Email",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        mobileTextfield.attributedPlaceholder = NSAttributedString(string: "Enter Mobile Number",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        otpTextfield.attributedPlaceholder = NSAttributedString(string: "OTP",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        usernameTextfield.attributedPlaceholder = NSAttributedString(string: "User Name",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        confirmPasswordTextfield.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        answerTextfield.attributedPlaceholder = NSAttributedString(string: "Answer",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
    }
    
    func toggleOtp() {
        
        switch otpToggle.selectedSegmentIndex {
        case 0:
            otpBoxView.isHidden = false
            questionBoxView.isHidden = true
         
        case 1:
            otpBoxView.isHidden = true
            questionBoxView.isHidden = false

        default:
          break
        }
        
    }
    
    func toggleSegment() {
        
        switch usernamePasswordToggle.selectedSegmentIndex {
            
        case 0:
            
            usernameBoxView.isHidden = false
            passwordBoxView.isHidden = true
            
        case 1:
            
            usernameBoxView.isHidden = true
            passwordBoxView.isHidden = false
            
            
        default:
            
            break
            
        }
    }
    
    
    func forgotPasswordBox() {
        
        forgotPasswordBoxView.layer.cornerRadius = 6.0
        forgotPasswordBoxView.layer.masksToBounds = true
        forgotPasswordBoxView.layer.borderWidth = 1.0
        forgotPasswordBoxView.layer.borderColor = UIColor.white.cgColor
        
    }
    

    @IBAction func toggleTapped(_ sender: Any) {
        toggleSegment()
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        
    }
    
    @IBAction func otpToggleTapped(_ sender: Any) {
        toggleOtp()
    }
    
    
}
