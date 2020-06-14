//
//  MainMenuViewController.swift
//  Ppong
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 14/06/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import UIKit

enum gameType {
    case easy
    case medium
    case hard
    case player2
}

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func moveToGame(game: gameType){
        let connect = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        currentGameType = game
        self.navigationController?.pushViewController(connect, animated: true)
    }
    
    @IBAction func playerTwoButton(_ sender: UIButton) {
        moveToGame(game: .player2)
    }
    
    @IBAction func easyButton(_ sender: Any) {
        moveToGame(game: .easy)
    }
    
    @IBAction func mediumButton(_ sender: Any) {
        moveToGame(game: .medium)
    }
    
    @IBAction func hardButton(_ sender: Any) {
        moveToGame(game: .hard)
    }
}
