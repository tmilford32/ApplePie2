//
//  ViewController.swift
//  ApplePie2
//
//  Created by MXC Swift on 9/2/20.
//  Copyright © 2020 MXC Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    var listOfWords = ["atlanta", "denver", "tallahassee", "juneau"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
    
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
         
    }
    var currentGame: Game!
    
    
    @IBAction func buttonPress(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        
        updateUI()
        
        updateGameState()
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        newRound()
    }
    
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
        updateUI()
        }else {
            enableLetterButtons(false)
        }
    }
     
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
            
        } else if currentGame.word == currentGame.formattedWord { totalWins += 1
        }else {
        
            updateUI()
            
        }
        
        
    
    



    }
}
