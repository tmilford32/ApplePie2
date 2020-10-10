//
//  Game.swift
//  ApplePie2
//
//  Created by MXC Swift on 9/3/20.
//  Copyright © 2020 MXC Swift. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining:Int
    var guessedLetters: [Character]
    
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
        } else {
            guessedWord += "_"
            }
            
        }
        return guessedWord
    }
    
    
        mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
            
        }
    }
    
}

