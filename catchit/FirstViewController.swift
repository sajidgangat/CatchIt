//
//  FirstViewController.swift
//  catchit
//
//  Created by Paul on 2017-06-21.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func logoutData(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "loginview", sender: self)
    }

    }

