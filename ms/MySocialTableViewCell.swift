//
//  MySocialTableViewCell.swift
//  ms
//
//  Created by Neil Ballard on 6/24/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class MySocialTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mysocialImage: UIImageView!
    
    @IBOutlet weak var mysocialText: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
