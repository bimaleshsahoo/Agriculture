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

class MenuViewController: UIViewController, ExpandableDelegate {

    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?

    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tableView: ExpandableTableView!
    
    var cell: UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID)!
    }
    
    var parentCells:[String] =
        [NormalCell.ID,ExpandableCell2.ID]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.expansionStyle = .single
        
        tableView.expandableDelegate = self
        tableView.animation = .automatic
        
        tableView.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: NormalCell.ID)
        tableView.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: ExpandedCell.ID)
        tableView.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: ExpandableCell2.ID)
        
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        return [50, 50, 50]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        if let cell = expandedCell as? ExpandedCell {
            print("\(cell.titleLabel.text ?? "")")
        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRow:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        
        switch indexPath.row {
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell1.titleLabel.text = "First Expanded Cell"
            let cell2 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell2.titleLabel.text = "Second Expanded Cell"
            let cell3 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell3.titleLabel.text = "Third Expanded Cell"
            return [cell1, cell2, cell3]
            
        default:
            break
        }
        return nil
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return parentCells.count
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: parentCells[indexPath.row]) else { return UITableViewCell() }
        return cell
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
