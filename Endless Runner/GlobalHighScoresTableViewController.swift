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

    var ref = Database.database().reference()
    var currentUser = Auth.auth().currentUser
    var localScores: [Int]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("working")
        let newRef =  ref.child(byAppendingPath:"Leaderboards")
        newRef.queryOrdered(byChild: "Score").queryLimited(toLast: 10).observeSingleEvent(of: .value, with: {(snapshot) in
            print(snapshot)
            
            print("working")
            
            
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
