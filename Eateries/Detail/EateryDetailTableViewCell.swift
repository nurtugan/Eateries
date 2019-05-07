//
//  EateryDetailTableViewCell.swift
//  Eateries
//
//  Created by Nurtugan on 2/12/19.
//  Copyright © 2019 Nurtugan Nuraly. All rights reserved.
//

import UIKit

class EateryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        keyLabel.numberOfLines = 0
        valueLabel.numberOfLines = 0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
