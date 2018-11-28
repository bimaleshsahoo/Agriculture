//
//  ExpandableCells.swift
//  Agriculture
//
//  Created by Bimalesh Sahoo on 25/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class NormalCell: UITableViewCell {
    static let ID = "NormalCell"
    @IBOutlet weak var normalLabel: UILabel!
}

class ExpandableCell2: ExpandableCell {
    static let ID = "ExpandableCell"
    @IBOutlet weak var expandableLabel: UILabel!
}

class ExpandedCell: UITableViewCell {
    static let ID = "ExpandedCell"
    
    @IBOutlet weak var expandedLabel: UILabel!
    
}
