//
//  ProspectTableviewControllerTableViewController.swift
//  catchit
//
//  Created by Paul on 2017-06-21.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class EditProspectiveViewController: UIViewController {

     @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var TextboxCompany: UITextField!
    
    @IBOutlet weak var TextboxCity: UITextField!
    @IBOutlet weak var TextboxAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
       // var stringpassed = ""
         TextboxCity.text = "Toronto"
         TextboxCompany.text = "Bermin And Co"
         TextboxAddress.text = "Lee Center Dr"
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: 375, height: 1200)
    }
    
    
    
    }
    

