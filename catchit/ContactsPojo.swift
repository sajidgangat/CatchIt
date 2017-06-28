//
//  ContactsPojo.swift
//  catchit
//
//  Created by Paul on 2017-06-28.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation


class ContactPojo{
    var Cont_ID: Int
    var Cont_FName: String
    var Cont_LName: String
    var Cont_Position: String
    
    
    init(Cont_ID: Int, Cont_FName: String, Cont_LName: String, Cont_Position: String) {
        // Initialize stored properties.
        self.Cont_ID = Cont_ID
        self.Cont_FName = Cont_FName
        self.Cont_LName = Cont_LName
        self.Cont_Position = Cont_Position
    }
    
    init() {
        // Initialize stored properties.
        self.Cont_ID = 0
        self.Cont_FName = ""
        self.Cont_LName = ""
        self.Cont_Position = ""
    }
}
