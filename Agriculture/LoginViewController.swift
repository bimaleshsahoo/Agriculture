//
//  LoginViewController.swift
//  Agriculture
//
//  Created by Bimalesh Sahoo on 21/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBoxView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var sendOtpBtn: UIButton!
    
    @IBOutlet weak var mobileTextfield: UITextField!
    @IBOutlet weak var otpTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var captchaTextfield: UITextField!
    
    @IBOutlet weak var loginToggle: UISegmentedControl!
    
    @IBOutlet weak var loginViaUsername: UIView!
    @IBOutlet weak var loginViaOtp: UIView!
    
    @IBOutlet weak var defaultLanguageView: UIView!
    @IBOutlet weak var lblDefaultLanguage: UILabel!
    
    @IBOutlet weak var btnDropDown: UIButton!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBoxView.layer.cornerRadius = 6.0
        loginBoxView.layer.masksToBounds = true
        loginBoxView.layer.borderWidth = 1.0
        loginBoxView.layer.borderColor = UIColor.white.cgColor
        
        loginToggle.layer.cornerRadius = 5.0
        loginToggle.layer.masksToBounds = true

        
        loginButton.layer.cornerRadius = 6.0
        loginButton.layer.masksToBounds = false
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0,height: 2.0)
        loginButton.layer.shadowRadius = 2.0
        loginButton.layer.shadowOpacity = 1.0
        //loginButton.layer.shadowPath = UIBezierPath(roundedRect:loginButton.bounds, cornerRadius:loginButton.layer.cornerRadius).cgPath
        
        sendOtpBtn.layer.cornerRadius = 3.0
        sendOtpBtn.layer.masksToBounds = false
        sendOtpBtn.layer.shadowColor = UIColor.black.cgColor
        sendOtpBtn.layer.shadowOffset = CGSize(width: 0,height: 2.0)
        sendOtpBtn.layer.shadowRadius = 1.0
        sendOtpBtn.layer.shadowOpacity = 1.0
       // sendOtpBtn.layer.shadowPath = UIBezierPath(roundedRect:sendOtpBtn.bounds, cornerRadius:sendOtpBtn.layer.cornerRadius).cgPath
        
        inputText()
        lblDefaultLanguage?.text = "English"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        dropDownSetup()

    }
    
    // MARK: - LANGUAGE DROPDOWN
    
    func dropDownSetup() {
        
        var languageDataSource = ["",""]
        let pListFileURL = Bundle.main.url(forResource: "Languages", withExtension: "plist", subdirectory: "")
        if let pListPath = pListFileURL?.path, let pListData = FileManager.default.contents(atPath: pListPath) {
                do {
                    let pListObject = try PropertyListSerialization.propertyList(from: pListData, options:PropertyListSerialization.ReadOptions(), format:nil)
 
                    guard let pListArray = pListObject as? [String] else {
                        return
                    }
                    
                    languageDataSource = pListArray
                } catch {
                    print("Error reading regions plist file: \(error)")
                    return
                }
        }
        
        dropDown.dataSource = languageDataSource as [AnyObject]
        dropDown.width = self.btnDropDown.frame.width
        dropDown.anchorView = self.btnDropDown
        dropDown.bottomOffset = CGPoint(x: 0, y:self.lblDefaultLanguage.bounds.height)
        
        self.dropDown.selectionAction = { [unowned self] (index, item) in
            self.dropDown.deselectRowAtIndexPath(index)
            self.lblDefaultLanguage.text = item
        }
            
    }
    
    @IBAction func btnLanguageDropDown(_ sender: Any) {
    
        if dropDown.isHidden{
            dropDown.show()
        }
        else
        {
            dropDown.hide()
        }
    }

    
    // MARK: - FUNCTION DEFINATIONS
    
    func inputText() {
        usernameTextfield.attributedPlaceholder = NSAttributedString(string: "Enter User Name",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        captchaTextfield.attributedPlaceholder = NSAttributedString(string: "Enter Captcha",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        mobileTextfield.attributedPlaceholder = NSAttributedString(string: "Enter Mobile Number",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        otpTextfield.attributedPlaceholder = NSAttributedString(string: "OTP",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    func toggleSegment() {
        
        switch loginToggle.selectedSegmentIndex {
            
        case 0:
            
            loginViaUsername.isHidden = false
            loginViaOtp.isHidden = true
            
        case 1:
            
            loginViaUsername.isHidden = true
            loginViaOtp.isHidden = false
            
            
        default:
            
            break
            
        }
    }
    
    
    //MARK: - BUTTON ACTIONS
    @IBAction func loginToggleTapped(_ sender: Any) {
    toggleSegment()
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
    }

    @IBAction func forgotPasswordTapped(_ sender: Any) {        
        let taskView = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        
        self.navigationController?.pushViewController(taskView, animated: true)
    }
    
    
    
}
