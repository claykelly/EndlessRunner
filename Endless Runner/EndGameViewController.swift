//
//  EndGameViewController.swift
//  Endless Runner
//
//  Created by Trey Guckian on 4/26/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class EndGameViewController: UIViewController {
    
    @IBAction func mainMenuButton(_ sender: Any) {
        self.performSegue(withIdentifier: "endGameToMainMenu", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = EndGameScene(fileNamed: "EndGameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.viewController = self
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
