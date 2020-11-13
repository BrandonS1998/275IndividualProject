//
//  itemCell.swift
//  BswettIndividualProject
//
//  Created by Brandon Swett on 11/11/20.
//

import UIKit

class itemCell : UITableViewCell {
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var pageLabel122 : UILabel!
    @IBOutlet var authorLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //titleLabel.adjustsFontForContentSizeCategory = true
        //pageLabel.adjustsFontForContentSizeCategory = true
        //authorLabel.adjustsFontForContentSizeCategory = true
    }

}
