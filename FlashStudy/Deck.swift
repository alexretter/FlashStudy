//
//  Deck.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/29/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation
import CoreData


class Deck: NSManagedObject {

    convenience init(name: String, deckofFlashcards: [Flashcard], unknownCards: [Flashcard], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Deck", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.flashcards
        self.unknownCards = [Flashcard]
    
    }
}
