//
//  test.swift
//  catchit
//
//  Created by Paul on 2017-06-27.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class test: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if(!isUserLoggedIn){
            self.performSegue(withIdentifier: "loginview", sender: self)
        }
        else
        {
            self.performSegue(withIdentifier: "signin", sender: self)
        

        }
    }

}
