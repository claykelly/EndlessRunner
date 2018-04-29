//
//  LocalHighScoresTableViewController.swift
//  Endless Runner
//
//  Created by Clay Kelly on 4/10/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LocalHighScoresViewController: UIViewController {
    
    var ref = Database.database().reference()
    var currentUser = Auth.auth().currentUser
    var localScores: [Int]  = []

    @IBOutlet weak var topScore: UILabel!
    
   
    @IBOutlet weak var secondScore: UILabel!
    
    @IBOutlet weak var thirdScore: UILabel!
    
    @IBOutlet weak var forthScore: UILabel!
    
    
    @IBOutlet weak var fifthScore: UILabel!
    
    
    @IBOutlet weak var sixthScore: UILabel!
    
    
    @IBOutlet weak var seventhScore: UILabel!
    
    @IBOutlet weak var eighthScore: UILabel!
    
    @IBOutlet weak var ninthScore: UILabel!
    
    @IBOutlet weak var tenthScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref.child("UserData").child((currentUser?.uid)!).child("Scores").observeSingleEvent(of: .value, with: {(snapshot) in
            
            var value = snapshot.value as? NSDictionary
            var score = value?["Top Score"] as? Int
            if let checkScore = score {
                self.topScore.text = String(score!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Second Best"] as? Int
            if let checkScore = score {
                self.secondScore.text = String(score!)
            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Third Best"] as? Int
            if let checkScore = score {
                self.thirdScore.text = String(score!)
            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Forth Best"] as? Int
            if let checkScore = score {
                self.forthScore.text = String(score!)
            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Fifth Best"] as? Int
            if let checkScore = score {
                self.fifthScore.text = String(score!)
            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Sixth Best"] as? Int
            if let checkScore = score {
                self.sixthScore.text = String(score!)
            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Seventh Best"] as? Int
            if let checkScore = score {
                self.seventhScore.text = String(score!)
            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Eighth Best"] as? Int
            if let checkScore = score {
                self.eighthScore.text = String(score!)
            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Ninth Best"] as? Int
            if let checkScore = score {
                self.ninthScore.text = String(score!)
            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Tenth Best"] as? Int
            if let checkScore = score {
                self.tenthScore.text = String(score!)
            }
            print(self.localScores)
            
        })
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "Local High Scores"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
}
