//
//  prospectViewTableViewCell.swift
//  catchit
//
//  Created by Paul on 2017-06-27.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class prospectViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var datetext: UILabel!
    @IBOutlet weak var compnaynametext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
