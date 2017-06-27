//
//  ProspectViewTableViewController.swift
//  catchit
//
//  Created by Paul on 2017-06-27.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ProspectViewTableViewController: UITableViewController {

    var PojoList = [ProspectPojo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         LoadDataFromNote()
    }

  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PojoList.count
    }
    func LoadDataFromNote()
    {
        
        // url of the API
        let myUrl = URL(string: "https://breezemaxlabs.com/RestAPI/v1/pros");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "email=nik@breeze.com"; // parameter passsed
        
        request.httpBody = postString.data(using: .utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                //print(json)
                let ResponseJsonArray = (json?["Prospects"] as! NSArray) as Array
                
                print("I got \(ResponseJsonArray)")
                
                for eachJsonObject in ResponseJsonArray
                {
                    let eachPojoBoj = ProspectPojo()
                    if let businessname = (eachJsonObject["Business_Name"]!)
                    {
                        eachPojoBoj.prs_busn_name = businessname as! String
                    }
                    self.PojoList.append(eachPojoBoj)
                }
                
                
            } catch
            {
                print(error)
            }
            
            for tt in self.PojoList
            {
                print(tt.prs_busn_name)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
        task.resume()
        
        
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! prospectViewTableViewCell
        // passsub = self.NotesList[(indexPath as NSIndexPath).row].Subject
        cell.datetext.text = self.PojoList[(indexPath as NSIndexPath).row].prs_busn_name
        //cell.compnaynametext.text = self.PojoList[(indexPath as NSIndexPath).row].prs_busn_name
        
        //cell.agelabel.text=patient.lastName
        // cell.addresslabel.text=patient.occupation
        // cell.departmentlabel.text=patient.bloodType
        
        
        // Configure the cell...
        return cell
    }

   
}
