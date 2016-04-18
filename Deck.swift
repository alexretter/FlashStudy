//
//  Deck.swift
//  FlashStudy
//
//  Created by Alex Retter on 4/18/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation
import CoreData


class Deck: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    convenience init(name: String, deckofFlashcards: [Flashcard], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Deck", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.flashcards = NSSet(array: deckofFlashcards)
    }
}
