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
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var menuTableView: ExpandableTableView!
    @IBOutlet weak var logoutView: UIView!
    
    var parentCells:[[String]] = [[
        NormalCell.ID,
        NormalCell.ID,
        ExpandableCell2.ID,
        NormalCell.ID,
        ExpandableCell2.ID,
        NormalCell.ID,
        ExpandableCell2.ID,
        NormalCell.ID,
        ExpandableCell2.ID,
        NormalCell.ID
        ]]

    //MARK: - Example Cell
    var cell: UITableViewCell {
        let exampleCell = menuTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
        exampleCell.expandedLabel.text = "Example Cell"
        return exampleCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTableView.expandableDelegate = self as ExpandableDelegate
        menuTableView.animation = .automatic
        
        menuTableView.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: NormalCell.ID)
        menuTableView.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: ExpandedCell.ID)
        menuTableView.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: ExpandableCell2.ID)
        menuTableView.expansionStyle = .single
        
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
        let viewMenuBack : UIView = (UIApplication.shared.keyWindow!.viewWithTag(11))!
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            var frameMenu : CGRect = viewMenuBack.frame
            frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
            viewMenuBack.frame = frameMenu
            viewMenuBack.layoutIfNeeded()
            viewMenuBack.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            viewMenuBack.removeFromSuperview()
        })
        utilities.logoutAlert(controller: self)
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

extension MenuViewController: ExpandableDelegate {
    
    //MARK: - Declaration of only Expandable Cells
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        switch indexPath.row {
        case 2:
            let cell1 = menuTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell1.expandedLabel.text = "Money Receipts"
            
            let cell2 = menuTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell2.expandedLabel.text = "Pay Preview"
            
            let cell3 = menuTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell3.expandedLabel.text = "Create New Farmer"
            
            let cell4 = menuTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell4.expandedLabel.text = "Pay History"
            
            let cell5 = menuTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell5.expandedLabel.text = "Coinsurrent Payment"
            
            let cell6 = menuTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell6.expandedLabel.text = "Disbursals"
            
            return [cell1, cell2, cell3, cell4, cell5, cell6]
            
        case 4:
            return [cell]
        case 6:
            return [cell,cell]
        case 8:
            return [cell,cell,cell]
        
        default:
            break
        }
        
        return nil
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        
        return [50, 50, 50, 50, 50, 50, 50, 50, 50, 50]
        
    }
    
    func numberOfSections(in tableView: ExpandableTableView) -> Int {
        return parentCells.count
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return parentCells[section].count
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRow:\(indexPath)")
        let viewMenuBack : UIView = (UIApplication.shared.keyWindow!.viewWithTag(11))!
        
        //MARK: - Navigation for Normal Cells as per indexPath
        if indexPath == [0,0] {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            dismissMenu(viewController: view)
            
        } else if indexPath == [0,1] {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "NewInsuranceViewController") as! NewInsuranceViewController
            dismissMenu(viewController: view)
            
        }
    }
    //MARK: - Navigation for Expanded Cells as per indexPath
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath) {
        print("didSelectExpandedRowAt:\(indexPath)")
        if indexPath == [0,3] {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "MoneyReceiptsViewController") as! MoneyReceiptsViewController

            dismissMenu(viewController: view)
            
        } else if indexPath == [0,4] {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "PayPreviewViewController") as! PayPreviewViewController
            
            dismissMenu(viewController: view)
            
        }  else if indexPath == [0,5] {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "CreateNewFarmerViewController") as! CreateNewFarmerViewController
            
            dismissMenu(viewController: view)
            
        }  else if indexPath == [0,6] {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "PayHistoryViewController") as! PayHistoryViewController
            
            dismissMenu(viewController: view)
            
        }  else if indexPath == [0,7] {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "CoinsurrentPaymentViewController") as! CoinsurrentPaymentViewController
            
            dismissMenu(viewController: view)
            
        }  else if indexPath == [0,8] {
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "DisbursalsViewController") as! DisbursalsViewController
            
            dismissMenu(viewController: view)
            
        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        if let cell = expandedCell as? ExpandedCell {
            print("\(cell.expandedLabel.text ?? "")")
        }
    }
    
    //MARK: - Display Cells at indexPath
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: parentCells[indexPath.section][indexPath.row]) else { return UITableViewCell() }

        switch indexPath.row {
        case 0:
            let cell1 = menuTableView.dequeueReusableCell(withIdentifier: NormalCell.ID) as! NormalCell
            cell1.normalLabel.text = "Home"
            
            return cell1
        case 1:
            let cell2 = menuTableView.dequeueReusableCell(withIdentifier: NormalCell.ID) as! NormalCell
            cell2.normalLabel.text = "New Insurance"
            
            return cell2
        case 2:
            let cell3 = menuTableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) as! ExpandableCell2
            cell3.expandableLabel.text = "Receipts and Payments"
            
            return cell3
        case 3:
            let cell4 = menuTableView.dequeueReusableCell(withIdentifier: NormalCell.ID) as! NormalCell
            cell4.normalLabel.text = "Existing Insurance"
            
            return cell4
        case 4:
            let cell5 = menuTableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) as! ExpandableCell2
            cell5.expandableLabel.text = "Status"
            
            return cell5
        case 5:
            let cell6 = menuTableView.dequeueReusableCell(withIdentifier: NormalCell.ID) as! NormalCell
            cell6.normalLabel.text = "Claim Initiation"
            
            return cell6
        case 6:
            let cell7 = menuTableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) as! ExpandableCell2
            cell7.expandableLabel.text = "Requests"
            
            return cell7
        case 7:
            let cell8 = menuTableView.dequeueReusableCell(withIdentifier: NormalCell.ID) as! NormalCell
            cell8.normalLabel.text = "My Documents"
            
            return cell8
        case 8:
            let cell9 = menuTableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) as! ExpandableCell2
            cell9.expandableLabel.text = "Reports"
            
            return cell9
        case 9:
            let cell10 = menuTableView.dequeueReusableCell(withIdentifier: NormalCell.ID) as! NormalCell
            cell10.normalLabel.text = "Refund of Claim"
            
            return cell10
        default:
            break
        }
        
        
        return cell
        
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func dismissMenu(viewController:UIViewController) {
        let viewMenuBack : UIView = (UIApplication.shared.keyWindow!.viewWithTag(11))!
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
                            var frameMenu : CGRect = viewMenuBack.frame
                            frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                            viewMenuBack.frame = frameMenu
                            viewMenuBack.layoutIfNeeded()
                            viewMenuBack.backgroundColor = UIColor.clear
                        }, completion: { (finished) -> Void in
                            viewMenuBack.removeFromSuperview()
                        })
        
        navigationControllerObj.pushViewController(viewController, animated: true)
    }
}

