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

class MenuViewController: UIViewController {

    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?

    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: Any) {
    
        let view = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    @IBAction func btn2(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        self.navigationController?.pushViewController(view, animated: true)
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
