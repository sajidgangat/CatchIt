//
//  NotesViewController.swift
//  catchit
//
//  Created by Paul on 2017-06-21.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        // url of the API
        let myUrl = URL(string: "https://breezemaxlabs.com/RestAPI/v1/notes");
        
        var request = URLRequest(url:myUrl!)
        var messageArray = [String]()
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "email=nik@breeze.com"; // parameter passsed
        
        request.httpBody = postString.data(using: .utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
          //  print("response = \(response)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
           
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                
                
                if let parseJSON = json {
        
                    // Now we can access value of First Name by its key
                    let firstNameValue = parseJSON["subject"] as? String
                    //print("firstNameValue: \(firstNameValue)")
                  //  let responseString = String(data: data!, encoding: .utf8)
                    
                    
                    
                    
                    let str = String(data: data!, encoding: .utf8)
                   
                    let data = str?.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                       // print(json)
                        
                        if let note = json["note"] as? [String] {
                            print(note)
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                    
                    

                  //  print("lol \(responseString!)")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        
        
        
        /*
         
         
         let str = "{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}"
         let data = str.data(using: String.Encoding.utf8, allowLossyConversion: false)!
         
         do {
         let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
         if let names = json["names"] as? [String] {
         print(names)
         }
         } catch let error as NSError {
         print("Failed to load: \(error.localizedDescription)")
         }
         */

        
        
              }

   
}
