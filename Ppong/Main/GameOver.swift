//
//  GameOver.swift
//  Ppong
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 17/06/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class GameOver: SKScene {
    
    let winner = SKLabelNode(fontNamed: "AmaticSC-Regular")
    let playAgain = SKLabelNode(fontNamed: "AmaticSC-Regular")
    
    override func didMove(to view: SKView) {
        
       
        if champion == whoWinIt.playerWon {
            winner.text = "Player Won"
        }else{
            winner.text = "Enemy Won"
        }
        winner.fontSize = 72
        winner.fontColor = UIColor.white
        winner.position = CGPoint(x: self.size.width * 0.5 , y: self.size.height * 0.7)
        self.addChild(winner)
        
        playAgain.text = "Play Again"
        playAgain.fontSize = 52
        playAgain.fontColor = UIColor.white
        playAgain.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.4)
        self.addChild(playAgain)
        
         
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches {
//            let poinOfTouch = touch.location(in: self)
//            if playAgain.contains(poinOfTouch){
//                
//                let sceneMove = MainMenu()
//                //sceneMove.scaleMode = self.scaleMode
//                let myTransition = .fade(withDuration: 0.5)
//                self.view!.presentScene(sceneMove, transition: myTransition)
//            }
//        }
//    }
}
