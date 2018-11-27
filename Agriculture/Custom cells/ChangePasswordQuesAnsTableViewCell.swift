//
//  ChangePasswordQuesAnsTableViewCell.swift
//  Agriculture
//
//  Created by Wipro on 25/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class ChangePasswordQuesAnsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblQues: UILabel!
    @IBOutlet weak var lblAnswer: UITextField!
    @IBOutlet weak var btnQuestion: UIButton!
    
    var dropDown = DropDown()
    var arrQuestions:Array<String>!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        arrQuestions = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit?","Aliquam mollis tortor a tempor congue?","Nam eget metus non leo faucibus commodo vel ac diam?","Vestibulum nec sem eget arcu molestie consectetur in id ante?","In in orci finibus, ultricies enim ut, accumsan sem?"]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpDropDown() {

        dropDown.dataSource = arrQuestions! as [AnyObject]
        dropDown.anchorView = btnQuestion
        dropDown.bottomOffset = CGPoint(x: 0, y:self.btnQuestion.bounds.height)
        dropDown.width = self.contentView.frame.size.width * 0.95

        
        self.dropDown.selectionAction = { [unowned self] (index, item) in
            self.dropDown.deselectRowAtIndexPath(index)
            self.lblQues.text = item
        }
    }
    
    @IBAction func btnActionQuesDropDown(_ sender: Any)
    {
        if dropDown.isHidden
        {
          let _ = dropDown.show()
        }
        else
        {
            dropDown.hide()
        }
    
    }
    

}
