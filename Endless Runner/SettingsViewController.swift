//
//  ViewController.swift
//  Endless Runner
//
//  Created by Karl Karlson on 3/27/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SettingsViewController: UIViewController {
    
    var ref = Database.database().reference()
    var currentUser = Auth.auth().currentUser
    

    @IBAction func clearHighScores(_ sender: Any) {
        let post = ["Top Score": 0,"Second Best": 0,"Third Best": 0,"Forth Best": 0,"Fifth Best": 0,"Sixth Best": 0,"Seventh Best": 0,"Eighth Best": 0,"Ninth Best": 0,"Tenth Best":0]
       ref.child("UserData").child((currentUser?.uid)!).child("Scores").setValue(post)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let newScore = addNewScore.create(_newScore: 0)
        newScore.addNew()        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
