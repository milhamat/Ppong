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

//protocol TransitionDelegate: SKSceneDelegate {
//    func returnToMainMenu()
//}

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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let poinOfTouch = touch.location(in: self)
            if playAgain.contains(poinOfTouch){
                print("playAgainTapped")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                        let vc = storyboard.instantiateViewController(withIdentifier: "MM")
                        vc.view.frame = (self.view?.frame)!
                        vc.view.layoutIfNeeded()

                        UIView.transition(with: self.view!, duration: 0.3, options: .transitionFlipFromRight, animations:
                            {
                                self.view?.window?.rootViewController = vc
                        }, completion: { completed in
                        })
                    }

            }
        }
    }

