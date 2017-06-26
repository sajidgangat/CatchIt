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
   
    var SubjectToDisplay : String?
    var NoteToDisplay : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        subjecttextbox.text = SubjectToDisplay
        notetextbox.text = NoteToDisplay
        
    }

   
    
}
