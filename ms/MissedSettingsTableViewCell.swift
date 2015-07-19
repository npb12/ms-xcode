//
//  MissedSettingsTableViewCell.swift
//  ms
//
//  Created by Neil Ballard on 7/12/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class MissedSettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var socialicon: UIImageView!
    
    @IBOutlet weak var textview: UITextView!
    
    @IBOutlet weak var missedsocialcheck: UIButton!
    
    @IBOutlet weak var settingsButton: MissedSettingsButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
