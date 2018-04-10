//
//  GameScene.swift
//  PracticeGame
//
//  Created by Trey Guckian on 4/9/18.
//  Copyright © 2018 Trey Guckian. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene{
    
    var orangeGuy = SKSpriteNode()
    var groundNode = SKSpriteNode()
    var backgroundNode = SKSpriteNode()
    
    var rect: CGRect?
    var rectWidth: CGFloat = 0.0
    
    override func didMove(to view: SKView) {
        setUp()
        Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector(GameScene.makeWall), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveWalls()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        orangeGuy.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 60))
    }
    
    func randomWidth(_ range:Range<Int>) -> CGFloat
    {
        let rndm = Int32(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
        let randCGF = CGFloat(rndm)
        return CGFloat(range.lowerBound) + randCGF
    }
    
    func setUp(){
        orangeGuy = self.childNode(withName: "OrangeGuy") as! SKSpriteNode
        orangeGuy.physicsBody = SKPhysicsBody(circleOfRadius: orangeGuy.size.width/2)
        groundNode = self.childNode(withName: "GroundNode") as! SKSpriteNode
        backgroundNode = self.childNode(withName: "BackgroundNode") as! SKSpriteNode
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.backgroundNode.frame)

    }
    
    @objc func makeWall(){
        var rectWidth = CGFloat()
        var rectHeight = CGFloat()
        
        rectWidth = CGFloat(randomWidth(37..<55))
        rectHeight = CGFloat(randomWidth(63..<85))
        
        let wallNode = SKShapeNode(rectOf: CGSize(width: rectWidth, height: rectHeight))
        wallNode.position.x = groundNode.frame.maxX + wallNode.frame.size.width
        wallNode.position.y = groundNode.frame.maxY + wallNode.frame.size.height/2 - 1
        wallNode.zPosition = 10.0
        wallNode.strokeColor = SKColor.magenta
        wallNode.fillColor = SKColor.magenta
        wallNode.name = "wallNode"
        self.addChild(wallNode)
    }
    
    func moveWalls(){
        self.enumerateChildNodes(withName: "wallNode") {
            node, stop in
            // do something with node or stop
            node.position.x -= 10
        }
    }
    
}


