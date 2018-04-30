//
//  GameScene.swift
//  PracticeGame
//
//  Created by Trey Guckian on 4/9/18.
//  Copyright © 2018 Trey Guckian. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let character:UInt32 = 0x1 << 0
    static let wall:UInt32 = 0x1 << 1
    static let coin:UInt32 = 0x1 << 2
}

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    var viewController: UIViewController?
    
    var playerChar = SKSpriteNode()
    var groundNode = SKSpriteNode()
    var backgroundNode = SKSpriteNode()
    var scoreLabel = SKLabelNode()
    var moveObstacles = SKAction()
    
    var currentScore: UInt32 = 0
    let store = UserDefaults.standard
    var timeBetweenWalls:Double = 0.0
    var wallSpeed:Double = 0.0
    var coinSpeed:Double = 0.0
    var gameOver:Bool = false
    
    private var moveAmtX: CGFloat = 0
    private var moveAmtY: CGFloat = 0
    private var initialPosition: CGPoint = CGPoint.zero
    private var initialTouch: CGPoint = CGPoint.zero
    
    override func didMove(to view: SKView) {
        setUp()
        physicsWorld.contactDelegate = self

        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(makeWall),
                SKAction.wait(forDuration: timeBetweenWalls)
                ])
        ))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch! {
            
            initialTouch = touch.location(in: self.scene!.view)
            moveAmtY = 0
            moveAmtX = 0
            initialPosition = self.position
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first as UITouch! {
            
            let movingPoint: CGPoint = touch.location(in: self.scene!.view)
            
            moveAmtX = movingPoint.x - initialTouch.x
            moveAmtY = movingPoint.y - initialTouch.y
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if moveAmtX == 0 || moveAmtY == 0{
            playerChar.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 50))
        }
        else if moveAmtY < 0{
            playerChar.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200))
        }
        else{
            playerChar.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -200))
        }
    }
    
    func random(_ range:Range<CGFloat>) -> CGFloat
    {
        let randInt32 = Int32(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
        let randCGF = CGFloat(randInt32)
        return CGFloat(range.lowerBound) + randCGF
    }
    
    //initiates sprite node, sprite physics body, ground node and background node and self physics body
    func setUp(){
        
        currentScore = 0
        groundNode = self.childNode(withName: "GroundNode") as! SKSpriteNode
        backgroundNode = self.childNode(withName: "BackgroundNode") as! SKSpriteNode
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.backgroundNode.frame)
        
        let selectedCharName = store.value(forKey: "Difficulty")!
        let name: String = String(describing: selectedCharName)
        
        switch name {
        case "OrangeGuy":
            timeBetweenWalls = 5
            wallSpeed = 5
            coinSpeed = 4
        case "guy3":
            timeBetweenWalls = 3
            wallSpeed = 5
            coinSpeed = 3
        case "guy2":
            timeBetweenWalls = 2
            wallSpeed = 2.5
            coinSpeed = 2
        default:
            timeBetweenWalls = 5
            wallSpeed = 5
            coinSpeed = 4
        }
        
        playerChar = SKSpriteNode(imageNamed: name)
        playerChar.xScale = 3.0
        playerChar.yScale = 3.0
        playerChar.name = "orangeGuy"
        playerChar.position.x = self.frame.minX + playerChar.frame.width
        playerChar.position.y = self.frame.minY + groundNode.frame.height
        playerChar.zPosition = 20.0
        
        let charPhysicsBody = SKPhysicsBody(circleOfRadius: playerChar.size.width/2)
        charPhysicsBody.categoryBitMask = PhysicsCategory.character
        charPhysicsBody.contactTestBitMask = PhysicsCategory.wall | PhysicsCategory.coin
        charPhysicsBody.collisionBitMask = PhysicsCategory.wall
        playerChar.physicsBody = charPhysicsBody
        addChild(playerChar)
        
        scoreLabel = SKLabelNode(fontNamed: "System")
        scoreLabel.text = "Score: \(currentScore)"
        scoreLabel.fontColor = UIColor.black
        scoreLabel.fontSize = 20
        scoreLabel.zPosition = 30.0
        scoreLabel.position = CGPoint(x: backgroundNode.frame.maxX - scoreLabel.frame.width, y: backgroundNode.frame.maxY - scoreLabel.frame.height*2)
        addChild(scoreLabel)

    }
    
    @objc func makeWall(){
        if !gameOver{
            currentScore += 1
            scoreLabel.text = "Score: \(currentScore)"
            
            let typeOfWall = arc4random_uniform(3)
            let typeOfFly = arc4random_uniform(2)
            let chosenWall:String
            let chosenFly:String
            
            switch typeOfWall {
            case 0:
                chosenWall = "hill_long"
            case 1:
                chosenWall = "spikes"
            case 2:
                chosenWall = "fence"
                wallSpeed += 2
            default:
                chosenWall = "spikes"
            }
            
            let wallNode = SKSpriteNode(imageNamed: chosenWall)
            wallNode.position.x = groundNode.frame.maxX + wallNode.frame.size.width
            wallNode.position.y = groundNode.frame.maxY + wallNode.frame.size.height/2 - 1
            wallNode.zPosition = 0
            wallNode.name = "wallNode"
            
            let physicsBody = SKPhysicsBody(rectangleOf: wallNode.frame.size)
            physicsBody.categoryBitMask = PhysicsCategory.wall
            physicsBody.affectedByGravity = false
            physicsBody.isDynamic = false
            wallNode.physicsBody = physicsBody
            
            addChild(wallNode)
            
            switch typeOfFly {
            case 0:
                chosenFly = "fly"
            case 1:
                chosenFly = "coin"
            default:
                chosenFly = "coin"
            }
            
            let coinNode = SKSpriteNode(imageNamed: chosenFly)
            let lowerY = groundNode.frame.maxY + coinNode.frame.size.height
            let upperY = backgroundNode.frame.maxY
            var randY = random(lowerY..<upperY)
            
            coinNode.position.x = groundNode.frame.maxX + coinNode.frame.width
            coinNode.position.y = randY
            coinNode.zPosition = 3
            coinNode.name = chosenFly
            
            let flyPhysBody = SKPhysicsBody(circleOfRadius: CGFloat(coinNode.frame.width/2))
            
            switch chosenFly {
            case "fly":
                flyPhysBody.categoryBitMask = PhysicsCategory.wall
            case "coin":
                flyPhysBody.categoryBitMask = PhysicsCategory.coin
            default:
                flyPhysBody.categoryBitMask = PhysicsCategory.coin
            }
            
            flyPhysBody.affectedByGravity = false
            flyPhysBody.isDynamic = false
            coinNode.physicsBody = flyPhysBody
            
            addChild(coinNode)
            
            //move walls
            let moveAction = SKAction.move(to: CGPoint(x: groundNode.frame.minX - wallNode.frame.width, y: groundNode.frame.maxY + wallNode.frame.size.height/2 - 1),
                                           duration: TimeInterval(wallSpeed))
            let moveActionDone = SKAction.removeFromParent()
            wallNode.run(SKAction.sequence([moveAction, moveActionDone]))
            
            randY = random(lowerY..<upperY)
            
            //move flies
            let flyMove = SKAction.move(to: CGPoint(x: groundNode.frame.minX - coinNode.frame.width, y: randY),
                                        duration: TimeInterval(coinSpeed))
            let flyMoveDone = SKAction.removeFromParent()
            coinNode.run(SKAction.sequence([flyMove, flyMoveDone]))
        }
        else{}
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        firstBody = contact.bodyA
        secondBody = contact.bodyB
        
        if (firstBody.node?.name == "orangeGuy" && secondBody.node?.name == "wallNode") ||  (firstBody.node?.name == "wallNode" && secondBody.node?.name == "orangeGuy") || (firstBody.node?.name == "orangeGuy" && secondBody.node?.name == "fly") || (firstBody.node?.name == "fly" && secondBody.node?.name == "orangeGuy"){
            charDidCollideWithWall()
        }
        else if (firstBody.node?.name == "orangeGuy" && secondBody.node?.name == "coin"){
            secondBody.node?.removeFromParent()
            currentScore += 3
        }
        else if (firstBody.node?.name == "coin" && secondBody.node?.name == "orangeGuy"){
            firstBody.node?.removeFromParent()
            currentScore += 3
        }
    }
    
    func charDidCollideWithWall(){
        gameOver = true
        store.setValue(currentScore, forKey: "FinalScore")
        
        let newScore = addNewScore.create(_newScore: Int(currentScore))
        newScore.addNew()
        
        let endGameVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "endGameViewController")
        self.viewController?.present(endGameVC, animated: true, completion: nil)
    }
    
}
