//
//  prospectpojo.swift
//  catchit
//
//  Created by Paul on 2017-06-27.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation

class ProspectPojo{
    var prs_id: Int
    var Address: String
    var Business_Name: String
    var City: String
    var CurrentStage:String
    var Date:String
    var Industry_Type:String
    var Meeting_Type:String
    var Met_Address:String
    var Prs_Notes:String
    var Prss_Notes:String
    var Service:String
    var Subject:String
    var Time:String
    var Year_End:String
    var prss_with_who:String
    
    init(prs_id: Int, Address: String, Business_Name: String, City: String, CurrentStage:String, Date:String, Industry_Type:String, Meeting_Type:String, Met_Address:String, Prs_Notes:String, Prss_Notes:String, Service:String,Subject:String,Time:String,Year_End:String,prss_with_who:String) {
        // Initialize stored properties.
        self.prs_id = prs_id
        self.Address = Address
        self.Business_Name = Business_Name
        self.City = City
        self.CurrentStage = CurrentStage
        self.Date = Date
        self.Industry_Type = Industry_Type
        self.Meeting_Type = Meeting_Type
        self.Met_Address = Met_Address
        self.Prs_Notes = Prs_Notes
        self.Prss_Notes = Prss_Notes
        self.Service = Service
        self.Subject = Subject
        self.Time = Time
        self.Year_End = Year_End
        self.prss_with_who = prss_with_who
        
    }
    
    init() {
        // Initialize stored properties.
        self.prs_id = 0
        self.Address = ""
        self.Business_Name = ""
        self.City = ""
        self.CurrentStage = ""
        self.Date = ""
        self.Industry_Type = ""
        self.Meeting_Type = ""
        self.Prs_Notes = ""
        self.Met_Address = ""
        self.Prss_Notes = ""
        self.Service = ""
        self.Subject = ""
        self.Time = ""
        self.Year_End = ""
        self.prss_with_who = ""
    }
}
