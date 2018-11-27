//
//  ChangePasswordViewController.swift
//  Agriculture
//
//  Created by Bimalesh Sahoo on 22/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    @IBOutlet weak var tableViewQuesAns: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var btnLetsGo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        passwordView.layer.cornerRadius = 6.0
        passwordView.layer.masksToBounds = true
        passwordView.layer.borderWidth = 1.0
        passwordView.layer.borderColor = UIColor.white.cgColor
        
        btnLetsGo.layer.cornerRadius = 6.0
        btnLetsGo.layer.masksToBounds = false
        btnLetsGo.layer.shadowColor = UIColor.black.cgColor
        btnLetsGo.layer.shadowOffset = CGSize(width: 0,height: 2.0)
        btnLetsGo.layer.shadowRadius = 2.0
        btnLetsGo.layer.shadowOpacity = 1.0
        btnLetsGo.layer.shouldRasterize = true
        
        scrollView.contentSize = contentView.frame.size
        passwordView.layer.cornerRadius = passwordView.frame.height * 0.05
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    //MARK: TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height/5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuesAnsCell", for: indexPath) as! ChangePasswordQuesAnsTableViewCell
        
        cell.quesAnsView.layer.cornerRadius = 6.0
        cell.quesAnsView.layer.masksToBounds = true
        cell.quesAnsView.layer.borderWidth = 1.0
        cell.quesAnsView.layer.borderColor = UIColor.white.cgColor
        
        cell.layer.cornerRadius = cell.frame.size.height * 0.05
        cell.setUpDropDown()
        return cell
        
    }
    
    @IBAction func letsGoTapped(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        navigationController.navigationBar.barTintColor = #colorLiteral(red: 0.9647058824, green: 0.5176470588, blue: 0.262745098, alpha: 1)
        
    }
    

}
