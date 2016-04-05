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
        
        return knownCardsCount - unknownCardsCount
        
    }
    
    static func getPercentageKnown(scoreCount: Int, flashcards: [Flashcard]) -> Double
    {
        return Double(scoreCount / flashcards.count)
    }
}