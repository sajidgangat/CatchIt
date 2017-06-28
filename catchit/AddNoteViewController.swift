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
    var status : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        // Do any additional setup after loading the view.
    }
    
    
    func createQuestions(handleComplete:(()->())){
        
        var request = URLRequest(url: URL(string: "https://breezemaxlabs.com/RestAPI/v1/createNote")!)
        request.httpMethod = "POST"
        let postString = "email=nik@breeze.com&subject=\(subjectTextBox.text!)&note=\(NoteTextBox.text!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else
            {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                self.status = 1
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            self.status = 0
            print("responseString = \(String(describing: responseString!))")
            
        }
        task.resume()
        
        
        handleComplete() // call it when finished s.t what you want
    }
    
    func newQuestion(){
        
        if(status == 0)
        {
            let alert = UIAlertController(title: "Note Added", message: "Click Back to check Your Notes", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:nil))
            self.present(alert, animated: true, completion: nil)
            // sleep
            //  performSegue(withIdentifier: "aftersave", sender: nil)
            
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Opps Something went wrong!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func AddNote(_ sender: Any) {
        
        self.createQuestions { () -> () in
            sleep(2)
            self.newQuestion()
            
            
        }
        
    }
    
}
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}


