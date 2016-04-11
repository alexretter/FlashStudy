//
//  QuizController.swift
//  FlashStudy
//
//  Created by Alex Retter on 4/5/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation

class QuizController
{
    static func scoreCardsKnown(knownCards: [Flashcard], unknownCards: [Flashcard]) -> Int {
        
        let knownCardsCount = knownCards.count
        let unknownCardsCount = unknownCards.count
        
        if unknownCardsCount == 0
        {
            return 100
        }
        else if knownCardsCount == 0
        {
            return 0
        }
        else if knownCardsCount > unknownCardsCount
        {
            let doubleScore = Double(unknownCardsCount) / Double(knownCardsCount)
            let intScore = Int(doubleScore * 100)
            print(intScore)
            return intScore
        }
        else
        {
            let doubleScore = Double(knownCardsCount) / Double(unknownCardsCount)
            let intScore = Int(doubleScore * 100)
            print(intScore)
            return intScore
        }
    }
}