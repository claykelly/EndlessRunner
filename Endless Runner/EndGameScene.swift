//
//  EndGameScene.swift
//  Endless Runner
//
//  Created by Trey Guckian on 4/26/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import GameplayKit

class EndGameScene: SKScene{
    
    var finalScoreLabel = SKLabelNode()
    var viewController: UIViewController?
    
    override func didMove(to view: SKView) {
        let store = UserDefaults.standard
        let finalScore = store.value(forKey: "FinalScore") as! UInt32
        finalScoreLabel = SKLabelNode(fontNamed: "System")
        finalScoreLabel.text = "Final Score: \(finalScore)"
        finalScoreLabel.fontColor = SKColor.white
        finalScoreLabel.fontSize = 45
        finalScoreLabel.zPosition = 30
        finalScoreLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(finalScoreLabel)
        
    }
    
}
