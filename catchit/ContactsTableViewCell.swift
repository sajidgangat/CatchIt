//
//  ContactsTableViewCell.swift
//  catchit
//
//  Created by Paul on 2017-06-28.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var Companynametext: UILabel!
    @IBOutlet weak var Lastnametext: UILabel!
    @IBOutlet weak var Firstnametext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
