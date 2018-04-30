//
//  ViewController.swift
//  Endless Runner
//
//  Created by Karl Karlson on 3/27/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit

class CharacterSelectViewController: UIViewController {
    let store = UserDefaults.standard

    @IBAction func easyButton(_ sender: UIButton) {
        store.setValue("OrangeGuy", forKey: "Difficulty")
    }
    
    @IBAction func medButton(_ sender: UIButton) {
        store.setValue("guy3", forKey: "Difficulty")
    }
    
    @IBAction func hardButton(_ sender: UIButton) {
        store.setValue("guy2", forKey: "Difficulty")
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

