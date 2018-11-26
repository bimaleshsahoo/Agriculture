//
//  MenuViewController.swift
//  Agriculture
//
//  Created by Bimalesh Sahoo on 22/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?

    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var logoutView: UIView!
    
    var menuDataList = [MenuData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menuData()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        logout()

    }
    
    //MARK: - Logout Functionality
    func logout() {
        
    let logoutTap = UITapGestureRecognizer(target: self, action: #selector(logoutTapped))
    logoutView.addGestureRecognizer(logoutTap)
    }
    
    @objc func logoutTapped() {
        
        utilities.logoutAlert()
    }
    
    //MARK: - Table View Delegates and Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "menu", for: indexPath as IndexPath) as! SideMenuTableViewCell
        
        var data = MenuData()
        
        data = menuDataList[indexPath.row]
        
        cell.lblMenu.text = data.datMenuItems
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        
            let view = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            self.navigationController?.pushViewController(view, animated: true)
        
        } else if indexPath.row == 1 {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "NewInsuranceViewController") as! NewInsuranceViewController
            
            self.navigationController?.pushViewController(view, animated: true)
            
        } else {
            menuTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func menuData() {
        
        for i in 0...7 {
            
            let menuData = MenuData()
            
            menuData.datMenuItems = menuItems[i]
            
            menuDataList.append(menuData)
            
        }
        
    }
    
    @IBAction func onCloseMenuClick(_ button: UIButton!) {
        
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
        
    }
    
    
}
