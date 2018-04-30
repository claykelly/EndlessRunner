//
//  GlobalHighScoresTableViewController.swift
//  Endless Runner
//
//  Created by Clay Kelly on 4/10/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class GlobalHighScoresViewController: UIViewController {

    
    @IBOutlet weak var topPlayer: UILabel!
    
    @IBOutlet weak var secondPlayer: UILabel!
    
    @IBOutlet weak var thirdPlayer: UILabel!
    
    @IBOutlet weak var forthPlayer: UILabel!
    
    @IBOutlet weak var fifthPlayer: UILabel!
    
    @IBOutlet weak var sixthPlayer: UILabel!
    
    @IBOutlet weak var seventhPlayer: UILabel!
    
    @IBOutlet weak var eighthPlayer: UILabel!
    
    @IBOutlet weak var ninthPlayer: UILabel!
    
    @IBOutlet weak var tenthPlayer: UILabel!
    
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
    
    var ref = Database.database().reference()
    var currentUser = Auth.auth().currentUser
    var localScores: [Int]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ref.child("Leaderboard").observeSingleEvent(of: .value, with: {(snapshot) in
            
            var value = snapshot.value as? NSDictionary
            var score = value?["Top Score"] as? Int
            if score != nil {
                self.topScore.text = String(score!)            }
            
            var user = value?["Top Player"] as? String
            if user != nil {
                self.topPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Second Best"] as? Int
            if score != nil {
                self.secondScore.text = String(score!)
            }
            
            user = value?["Second Player"] as? String
            if user != nil {
                self.secondPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Third Best"] as? Int
            if score != nil {
                self.thirdScore.text = String(score!)
            }
            
            user = value?["Third Player"] as? String
            if user != nil{
                self.thirdPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Forth Best"] as? Int
            if score != nil {
                self.forthScore.text = String(score!)
            }
            
            user = value?["Forth Player"] as? String
            if user != nil{
                self.forthPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Fifth Best"] as? Int
            if score != nil {
                self.fifthScore.text = String(score!)
            }
            
            user = value?["Fifth Player"] as? String
            if user != nil {
                self.fifthPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Sixth Best"] as? Int
            if score != nil {
                self.sixthScore.text = String(score!)
            }
            
            user = value?["Sixth Player"] as? String
            if user != nil{
                self.sixthPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Seventh Best"] as? Int
            if score != nil {
                self.seventhScore.text = String(score!)
            }
            
            user = value?["Seventh Player"] as? String
            if user != nil{
                self.seventhPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Eighth Best"] as? Int
            if score != nil {
                self.eighthScore.text = String(score!)
            }
            
            user = value?["Eighth Player"] as? String
            if user != nil{
                self.eighthPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Ninth Best"] as? Int
            if score != nil {
                self.ninthScore.text = String(score!)
            }
            
            user = value?["Ninth Player"] as? String
            if user != nil {
                self.ninthPlayer.text = String(user!)            }
            
            value = snapshot.value as? NSDictionary
            score = value?["Tenth Best"] as? Int
            if score != nil{
                self.tenthScore.text = String(score!)
            }
            
            user = value?["Tenth Player"] as? String
            if user != nil{
                self.tenthPlayer.text = String(user!)            }
            
        })
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "Global High Scores"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
