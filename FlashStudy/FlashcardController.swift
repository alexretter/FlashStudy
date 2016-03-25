//
//  FlashcardController.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation

class FlashcardController {
    
    static func createCard(questionText: String, answerText: String) -> Flashcard {
        
        let flashCard = Flashcard(question: questionText, answer: answerText)
        
        return flashCard
    }
}