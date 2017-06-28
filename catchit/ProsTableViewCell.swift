//
//  ProsTableViewCell.swift
//  catchit
//
//  Created by Paul on 2017-06-28.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ProsTableViewCell: UITableViewCell {
   // @IBOutlet weak var sub: UILabel!
    @IBOutlet weak var cname: UILabel!
    override func awakeFromNib() {
     
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
