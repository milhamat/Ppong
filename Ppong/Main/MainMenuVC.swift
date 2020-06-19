//
//  MainMenu.swift
//  Ppong
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 18/06/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//
// ------------------------------------------------------
//import Foundation
//import SpriteKit
//
//enum gameType{
//    case easy
//    case medium
//    case hard
//    case player2
//}
//
//class MainMenuVC: SKScene{
//
//    let title = SKLabelNode(fontNamed: "AmaticSC-Regular")
//    let player2 = SKLabelNode(fontNamed: "AmaticSC-Regular")
//    let easy = SKLabelNode(fontNamed: "AmaticSC-Regular")
//    let medium = SKLabelNode(fontNamed: "AmaticSC-Regular")
//    let hard = SKLabelNode(fontNamed: "AmaticSC-Regular")
//
//    override func didMove(to view: SKView) {
//
//        title.text = "Ppong"
//        title.fontSize = 62
//        title.fontColor = UIColor.white
//        title.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.85)
//        self.addChild(title)
//
//        player2.text = "Player 2"
//        player2.fontSize = 42
//        player2.fontColor = UIColor.white
//        player2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.75)
//        player2.name = "Player2"
//        self.addChild(player2)
//
//        easy.text = "Easy"
//        easy.fontSize = 42
//        easy.fontColor = UIColor.white
//        easy.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
//        easy.name = "Easy"
//        self.addChild(easy)
//
//        medium.text = "Meduim"
//        medium.fontSize = 42
//        medium.fontColor = UIColor.white
//        medium.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.45)
//        medium.name = "Medium"
//        self.addChild(medium)
//
//        hard.text = "Hard"
//        hard.fontSize = 42
//        hard.fontColor = UIColor.white
//        hard.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.40)
//        hard.name = "Hard"
//        self.addChild(hard)
//    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches{
//
//            let pointOfTouch = touch.location(in: self)
//            let nodeITapped = atPoint(pointOfTouch)
//
//            if nodeITapped.name == "Player2" {
//
//                currentGameType = gameType.player2
//                let sceneToMoveTo = GameScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
//
//            }else if nodeITapped.name == "Easy"{
//
//                currentGameType = gameType.easy
//                let sceneToMoveTo = GameScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
//
//            }else if nodeITapped.name == "Medium"{
//
//                currentGameType = gameType.medium
//                let sceneToMoveTo = GameScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
//
//            }else{
//
//                currentGameType = gameType.hard
//                let sceneToMoveTo = GameScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
//
//            }
//        }
//   }
//}
