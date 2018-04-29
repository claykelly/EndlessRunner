//
//  GlobalHighScoresTableViewController.swift
//  Endless Runner
//
//  Created by Clay Kelly on 4/10/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit

class GlobalHighScoresViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
