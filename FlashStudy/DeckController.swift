//
//  DeckController.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation

class DeckController {

    static func createDeck(name:String) -> Deck {
        
        let newDeck = Deck(name: name)
        
        return newDeck
   }

}