//
//  ViewController.swift
//  lifecounter
//
//  Created by Anthony Soeung on 2/1/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var playerRowStacks: [UIStackView]!;
    @IBOutlet var playerLifeLabels: [UILabel]!;
    @IBOutlet var playerInputs: [UITextField]!;
    @IBOutlet weak var statusLabel: UILabel!;
    @IBOutlet weak var addPlayerButton: UIButton!;
    @IBOutlet weak var removePlayerButton: UIButton!;

    var playerLifes = [20, 20, 20, 20, 20, 20, 20, 20];
    var activePlayers = 4;
    var history: [String] = [];
    var gameStarted = false;

    override func viewDidLoad() {
        super.viewDidLoad();
        updatePlayerVisibility();
        updateUI();
    }

    @IBAction func addPlayerTapped(_ sender: UIButton) {
        if activePlayers < 8 {
            activePlayers += 1;
            updatePlayerVisibility();
            updateUI();
        }
        
        sender.isEnabled = (activePlayers < 8);
    }
    
    @IBAction func removePlayerTapped(_ sender: UIButton) {
        if activePlayers > 2 {
            activePlayers -= 1;
            updatePlayerVisibility();
            updateUI();
        }
        addPlayerButton.isEnabled = (activePlayers < 8);
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        playerLifes = [20, 20, 20, 20, 20, 20, 20, 20];
        activePlayers = 4;
        history = [];
        gameStarted = false;
        addPlayerButton.isEnabled = true;
        removePlayerButton.isEnabled = true;
        statusLabel.text = "Game in Progress...";
        updatePlayerVisibility();
        updateUI();
    }

    @IBAction func changeLifeTapped(_ sender: UIButton) {
        let playerIndex = sender.tag;
        let buttonText = sender.titleLabel?.text ?? "";
        var amount = 0;
        switch buttonText {
        case "+": amount = 1;
        case "-": amount = -1;
        case "+5": amount = 5;
        case "-5": amount = -5;
        default: amount = 0;
        }
        
        applyLifeChange(playerIndex: playerIndex, amount: amount);
    }

    @IBAction func customLifeAdjust(_ sender: UIButton) {
        let index = sender.tag;
        
        if index < playerInputs.count {
            let inputText = playerInputs[index].text ?? "";
            let amount = Int(inputText) ?? 0;
            applyLifeChange(playerIndex: index, amount: amount);

            playerInputs[index].text = "";
            playerInputs[index].resignFirstResponder();
        }
    }

    func applyLifeChange(playerIndex: Int, amount: Int) {
        playerLifes[playerIndex] += amount;
        gameStarted = true;
        addPlayerButton.isEnabled = false;
        removePlayerButton.isEnabled = false;
        let action = amount >= 0 ? "gained" : "lost";
        history.append("Player \(playerIndex + 1) \(action) \(abs(amount)) life.");
        updateUI();
    }

    func updatePlayerVisibility() {
        for i in 0..<playerRowStacks.count {
            playerRowStacks[i].isHidden = (i >= activePlayers);
        }
    }
    
    func updateUI() {
        for i in 0..<activePlayers {
            if i < playerLifeLabels.count && i < playerLifes.count {
                playerLifeLabels[i].text = "\(playerLifes[i])";
                
                if playerLifes[i] <= 0 {
                    statusLabel.text = "Player \(i + 1) LOSES!";
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory" {
            if let destVC = segue.destination as? HistoryViewController {
                destVC.historyLog = self.history;
            }
        }
    }
}
