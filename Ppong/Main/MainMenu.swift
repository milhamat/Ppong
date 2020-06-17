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

class MainMenu: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var player2Button: UIButton!
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLable.font = UIFont(name: "AmaticSC-Regular", size: 46)
        titleLable.text = "Ppong"

        player2Button.titleLabel?.font = UIFont(name: "AmaticSC-Regular", size: 32)
        player2Button.titleLabel?.textColor = UIColor.white
        
        easyButton.titleLabel?.font = UIFont(name: "AmaticSC-Regular", size: 32)
        mediumButton.titleLabel?.font = UIFont(name: "AmaticSC-Regular", size: 32)
        hardButton.titleLabel?.font = UIFont(name: "AmaticSC-Regular", size: 32)
        
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
