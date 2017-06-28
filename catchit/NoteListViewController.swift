//
//  NoteListViewController.swift
//  catchit
//
//  Created by Paul on 2017-06-26.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class NoteListViewController: UIViewController {

    @IBOutlet weak var subjecttextbox: UITextField!
    @IBOutlet weak var notetextbox: UITextView!
     var status : Int?
    
    var SubjectToDisplay : String?
    var NoteToDisplay : String?
    var noteid : Int?
    var email : String?
    var datevar : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.hideKeyboard()
    subjecttextbox.text = SubjectToDisplay!
    notetextbox.text = NoteToDisplay!
       
    }
    func UpdateNote(handleComplete:(()->())){
        
        var request = URLRequest(url: URL(string: "https://breezemaxlabs.com/RestAPI/v1/createNote")!)
        request.httpMethod = "POST"
        let postString = "note_id=\(noteid!)&email=nik@breeze.com&subject=\(subjecttextbox.text!)&note=\(notetextbox.text!)&date=\(datevar!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else
            {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                //self.status = 1
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            //self.status = 0
            print("responseString = \(String(describing: responseString!))")
            
        }
        task.resume()
        
        
        handleComplete() // call it when finished s.t what you want
    }

    func Check(){
        
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
    
    
    
    @IBAction func UpdateCalled(_ sender: Any) {
        
        self.UpdateNote { () -> () in
            sleep(2)
           // self.Check()
            
            
        }
        
    }
    
    @IBAction func DeleteBtn(_ sender: Any) {
        
        var request = URLRequest(url: URL(string: "https://breezemaxlabs.com/RestAPI/v1/deleteNote")!)
        request.httpMethod = "POST"
        let postString = "note_id=\(noteid!)&email=nik@breeze.com"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else
            {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            //var value = String(describing: responseString!)
            //self.LoginDone(responseString!)
            
            print("responseString = \(String(describing: responseString!))")
            
        }
        task.resume()
        
        
    }

        
}
