//
//  Player.swift
//  lifecounter
//
//  Created by Anthony Soeung on 2/4/26.
//


import UIKit

protocol PlayerDelegate: AnyObject {
    func didUpdateLife(playerIndex: Int, change: Int, currentLife: Int)
}

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    
    weak var delegate: PlayerDelegate?
    var playerIndex: Int = 0
    var life: Int = 20

    @IBAction func adjustLife(_ sender: UIButton) {
        let amount = Int(inputField.text ?? "") ?? 1
        let change = sender.tag == 1 ? amount : -amount
        
        life += change
        lifeLabel.text = "\(life)"
        
        delegate?.didUpdateLife(playerIndex: playerIndex, change: change, currentLife: life)
    }
}
