//
//  GameScene.swift
//  Ppong
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 13/06/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var player = SKSpriteNode()
    var playerScore = SKLabelNode()
    var enemyScore = SKLabelNode()
  //  let scoreLabel = SKLabelNode(fontNamed: "AmaticSC-Regular")
  //  let random = Int.random(in: 1...20)
  //  var borderOne = SKSpriteNode()
  //  var borderTwo = SKSpriteNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        // startGame()
        
        score = [0,0]
        
        playerScore.text = "0"
        enemyScore.text = "0"
        
        // scoreLabel.text = "P / E"
        // scoreLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        // scoreLabel.fontColor = SKColor.white
        // scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        // scoreLabel.zPosition = 0
        // scoreLabel.fontSize = 40
        // self.addChild(scoreLabel)
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.position.y = (self.frame.height / 2) - 50
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        player.position.y = (-self.frame.height / 2) + 50
        
        playerScore = self.childNode(withName: "playerScore") as! SKLabelNode
        enemyScore = self.childNode(withName: "enemyScore") as! SKLabelNode
       // borderOne = self.childNode(withName: "borderOne") as! SKSpriteNode
       // borderTwo = self.childNode(withName: "borderTwo") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20)) // where the ball will move
        ball.physicsBody?.mass = 0.0314159281551838
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1 // bounce effect
        
        self.physicsBody = border
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if currentGameType == .player2 {
                if location.y > 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.0))
                }
                if location.y < 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.0))
                }
            }else{
            player.run(SKAction.moveTo(x: location.x, duration: 0.0))
            }
        }
    }
    
   // func startGame(){
   //     score = [0,0]
   // }
    
    func addScore(playerWhoWon: SKSpriteNode){
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == player{
            score[0] += 1
            playerScore.text = "\(score[0])"
            print("player : \(score[0])")
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }
        else if playerWhoWon == enemy{
            score[1] += 1
            enemyScore.text = "\(score[1])"
            print("enemy : \(score[1])")
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        
        //print(score)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.0))
                }
                if location.y < 0 {
                    player.run(SKAction.moveTo(x: location.x, duration: 0.0))
                }
            }else {
                player.run(SKAction.moveTo(x: location.x, duration: 0.0))
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        switch currentGameType {
        case .easy:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
            break
        case .medium:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.8))
            break
        case .hard:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
            break
        case .player2:
            
            break
        }
        
        if ball.position.y <= player.position.y - 15{
            addScore(playerWhoWon: enemy)
            
        } else if ball.position.y >= enemy.position.y + 15{
            addScore(playerWhoWon: player)
            
        }
    }
}
