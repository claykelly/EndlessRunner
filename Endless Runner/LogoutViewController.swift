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

class LogoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "goToLogin", sender: self)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
}

