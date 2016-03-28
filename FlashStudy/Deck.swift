//
//  Deck.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation

class Deck {
    
    var name: String
    
    var deckOfFlashcards = [Flashcard]()
    
    var unknownCards = [Flashcard]()
    
    init(name:String) {
        self.name = name
    }
}