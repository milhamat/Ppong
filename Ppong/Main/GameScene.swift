//
//  GameScene.swift
//  Ppong
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 13/06/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import SpriteKit
import GameplayKit

var score = [Int]()

enum whoWinIt{
    case playerWon
    case enemyWon
    case playerTwoWon
    case draw
}

var champion = whoWinIt.draw

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var player = SKSpriteNode()
    var playerScore = SKLabelNode()
    var enemyScore = SKLabelNode()
  // MARK: -First Launc Screen
    override func didMove(to view: SKView) {
        
        score = [0,0]
        
        playerScore.text = "0"
        enemyScore.text = "0"
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        ball.name = "ball"
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.name = "enemy"
        enemy.position.y = (self.frame.height / 2) - 50
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        player.name = "player"
        player.position.y = (-self.frame.height / 2) + 50
        
        playerScore = self.childNode(withName: "playerScore") as! SKLabelNode
        enemyScore = self.childNode(withName: "enemyScore") as! SKLabelNode
       
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20)) // where the ball will move
        ball.physicsBody?.mass = 0.0314159281551838
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1 // bounce effect
        
        self.physicsBody = border
    }
    // MARK: -When Touch Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if currentGameType == .player2 {
                if location.y > 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.0))
                }
                if location.y < 0{
                    player.run(SKAction.moveTo(x: location.x, duration: 0.0))
                }
            }else{
            player.run(SKAction.moveTo(x: location.x, duration: 0.0))
            }
        }
    }
    
   // func startGame(){
   //     score = [0,0]
   // }
    // MARK: -Score Logic
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
        
        if score[0] == 5 || score[1] == 5 {
            if score[0] == 5{
                print("playerWon")
                champion = whoWinIt.playerWon
            } else {
                print("enemyWon")
                champion = whoWinIt.enemyWon
            }
            gameOver()
            print("trigered")
        }
        //print(score)
    }
    // MARK: -GameOver and ScreenChange
    func gameOver(){
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        player.isPaused = true
        enemy.isPaused = true
        
        let changeScene = SKAction.run(changeScreen)
        let waitToChange = SKAction.wait(forDuration: 1)
        let changeScreenScene = SKAction.sequence([changeScene,waitToChange])
        self.run(changeScreenScene)

    }
    
    func changeScreen(){
        let sceneMove = GameOver(size: self.size)
        sceneMove.scaleMode = self.scaleMode
        let transitionTime = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneMove, transition: transitionTime)
    }
    // MARK: -Update
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
        
        if ball.position.y <= player.position.y - 20{
            addScore(playerWhoWon: enemy)
            
        } else if ball.position.y >= enemy.position.y + 20{
            addScore(playerWhoWon: player)
            
        }
//        print("enemy : \(score[1])")
//        print("player : \(score[0])")
    }
}
