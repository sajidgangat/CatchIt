//
//  AddNoteViewController.swift
//  catchit
//
//  Created by Paul on 2017-06-26.
//  Copyright © 2017 Paul. All rights reserved.
//
import Foundation
import UIKit

class AddNoteViewController: UIViewController {
    @IBOutlet weak var subjectTextBox: UITextField!
    
    @IBOutlet weak var NoteTextBox: UITextView!
    var status : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddNote(_ sender: Any) {
        
        var request = URLRequest(url: URL(string: "https://breezemaxlabs.com/RestAPI/v1/createNote")!)
        request.httpMethod = "POST"
        let postString = "email=nik@breeze.com&subject=\(subjectTextBox.text!)&note=\(NoteTextBox.text!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else
            {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            self.status = responseString
            print("responseString = \(String(describing: responseString))")
            
            
        }
        task.resume()
        
        popToRoot()
    }
    func popToRoot() {
        
        let alert = UIAlertController(title: "Alert", message: "\(String(describing: status)))", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


