//
//  ViewController.swift
//  lifecounter
//
//  Created by Anthony Soeung on 2/1/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var player2LifeLabel: UILabel!
    @IBOutlet weak var player1LifeLabel: UILabel!

    var player1Life = 20
    var player2Life = 20

    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Game in Progress..."
    }

    @IBAction func player1Add1( sender: Any) {
        player1Life += 1
        updateUI()
    }

    @IBAction func sfchaelri( sender: Any) {

    }
    @IBAction func player1Minus( sender: Any) {
        player1Life -= 1
        updateUI()
    }

    @IBAction func player1Add5( sender: Any) {
        player1Life += 5
        updateUI()
    }

    @IBAction func player1Minus5( sender: Any) {
        player1Life -= 5
        updateUI()
    }
    
    @IBAction func player2Add( sender: Any) {
        player2Life += 1
        updateUI()
    }

    @IBAction func player2Minus( sender: Any) {
        player2Life -= 1
        updateUI()
    }

    @IBAction func player2Add5( sender: Any) {
        player2Life += 5
        updateUI()
    }

    @IBAction func player2Minus5(_ sender: Any) {
        player2Life -= 5
        updateUI()
    }

    func updateUI() {
            player1LifeLabel.text = "\(player1Life)"
            player2LifeLabel.text = "\(player2Life)"

            if player1Life <= 0 {
                statusLabel.text = "Player 1 LOSES!"
            } else if player2Life <= 0 {
                statusLabel.text = "Player 2 LOSES!"
            } else {
                statusLabel.text = "Game in Progress..."
            }
    }

}

