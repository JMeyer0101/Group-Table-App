//
//  ConcertTableViewCell.swift
//  simpletable
//
//  Created by Jason Meyer on 4/23/16.
//  Copyright © 2016 Jason Meyer. All rights reserved.
//

import UIKit

class ConcertTableViewCell: UITableViewCell {
    
    var venuelocation: String!
    @IBOutlet var bandname: UILabel!
    @IBOutlet var monthlabel: UILabel!
    @IBOutlet var datelabel: UILabel!
    @IBOutlet var photobutton: UIButton!
    @IBOutlet var mapsbutton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
