//
//  ViewController.swift
//  Endless Runner
//
//  Created by Karl Karlson on 3/27/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var localHighscores =  [1,2,3,4,5]
    
    func returnLocalHighscores() -> [Int] {
        return localHighscores
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
