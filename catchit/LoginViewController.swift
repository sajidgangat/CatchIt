//
//  LoginViewController.swift
//  catchit
//
//  Created by Paul on 2017-06-27.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var EmailTextBox: UITextField!
    @IBOutlet weak var PasswordTextbox: UITextField!
    @IBOutlet var _login_button: UIButton!
    @IBOutlet weak var RemeberMeButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        RemeberMeButton.addTarget(self, action: #selector(self.stateChanged), for: .valueChanged)
        let defaults: UserDefaults? = UserDefaults.standard
        
        // check if defaults already saved the details
        
        if (defaults?.bool(forKey: "ISRemember"))! {
            EmailTextBox.text = defaults?.value(forKey: "SavedUserName") as? String
            PasswordTextbox.text = defaults?.value(forKey: "SavedPassword") as? String
            RemeberMeButton.setOn(true, animated: false)
        }
        else {
            RemeberMeButton.setOn(false, animated: false)
        }
    }
    
    func stateChanged(_ switchState: UISwitch) {
        
        let defaults: UserDefaults? = UserDefaults.standard
        if switchState.isOn {
            defaults?.set(true, forKey: "ISRemember")
            defaults?.set(EmailTextBox.text, forKey: "SavedUserName")
            defaults?.set(PasswordTextbox.text, forKey: "SavedPassword")
        }
        else {
            defaults?.set(false, forKey: "ISRemember")
        }
    }
    
    
    
    @IBAction func ClickLoginButton(_ sender: Any) {
        
        
        if(_login_button.titleLabel?.text == "Logout")
        {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            //LoginToDo()
            return
        }
        
        
        let username = EmailTextBox.text
        let password = PasswordTextbox.text
        
        if(username == "" || password == "")
        {
            return
        }
        
        DoLogin(username!, password!)
        
        
    }
    func DoLogin(_ user:String, _ psw:String)
    {
        var request = URLRequest(url: URL(string: "https://breezemaxlabs.com/RestAPI/v1/login")!)
        request.httpMethod = "POST"
        let postString = "email=\(user)&pass=\(psw)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else
            {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            //var value = String(describing: responseString!)
            self.LoginDone(responseString!)
            
            print("responseString = \(String(describing: responseString!))")
            
        }
        task.resume()
    
}
    

    func LoginToDo(_ abc:String)
    {
        EmailTextBox.isEnabled = true
        PasswordTextbox.isEnabled = true
        
        _login_button.setTitle("Login", for: .normal)
    }
    
    func LoginDone(_ abb:String)
    {
        let  a  = abb
        
        print (a)
        if(a == "true")
        {
            EmailTextBox.isEnabled = false
            PasswordTextbox.isEnabled = false
            
            _login_button.setTitle("Logout", for: .normal)

        }
           }
}

