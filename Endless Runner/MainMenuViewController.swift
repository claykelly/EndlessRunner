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

class MainMenuViewController: UIViewController {
    
    var ref = Database.database().reference()
    var currentUser = Auth.auth().currentUser
    
    @IBOutlet weak var UserNameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ref.child("UserData").child((currentUser?.uid)!).child("Name").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["username"] as? String
            if let checkName = name{
            self.UserNameLabel.text = checkName
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Test
    }
    
    
}
