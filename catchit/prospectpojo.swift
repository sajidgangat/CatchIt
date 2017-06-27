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
    var prs_busn_name: String
    var prs_type: String
    var prs_year_end: String
    var service:String
    var prs_notes:String
    var prospect_status:String
    var user_id:String
    var prs_closed_date:String
    var prs_sale_value:String
    var prs_reason:String
    var pros_date:String
    
    init(prs_id: Int, prs_busn_name: String, prs_type: String, prs_year_end: String, service:String, prs_notes:String, prospect_status:String, user_id:String, prs_closed_date:String, prs_sale_value:String, prs_reason:String, pros_date:String) {
        // Initialize stored properties.
        self.prs_id = prs_id
        self.prs_busn_name = prs_busn_name
        self.prs_type = prs_type
        self.prs_year_end = prs_year_end
        self.service = service
        self.prs_notes = prs_notes
        self.prospect_status = prospect_status
        self.user_id = user_id
        self.prs_closed_date = prs_closed_date
        self.prs_sale_value = prs_sale_value
        self.prs_reason = prs_reason
        self.pros_date = pros_date
        
    }
    
    init() {
        // Initialize stored properties.
        self.prs_id = 0
        self.prs_busn_name = ""
        self.prs_type = ""
        self.prs_year_end = ""
        self.service = ""
        self.prs_notes = ""
        self.prospect_status = ""
        self.user_id = ""
        self.prs_sale_value = ""
        self.prs_closed_date = ""
        self.prs_reason = ""
        self.pros_date = ""
    }
}
