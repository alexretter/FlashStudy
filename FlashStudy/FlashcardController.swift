//
//  FlashcardController.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation
import CoreData

class FlashcardController {
    
    static let sharedController = FlashcardController()
    
    var flashcard: Flashcard?
    
    func fetchAllFlashcardsForDeck(deck: Deck) -> [Flashcard]? {
        
        let request = NSFetchRequest(entityName: "Flashcard")
        
        do {
            
            let flashcards = try deck.managedObjectContext?.executeFetchRequest(request) as! [Flashcard]
            for card in flashcards
            {
                print(card.question)
            }
            print("FETCHING ALL FLASHCARDS SUCCEEDED")
            return flashcards
            
        } catch {
            
            return []
        }
    }
    
    static func saveToPersistentStore() {
        
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
            print("SUCESS SAVING")
        } catch {
            print("Error saving \(error)")
        }
    }
    
    static func insertFlashcardIntoContext(context: NSManagedObjectContext) -> Flashcard {
        
       return NSEntityDescription.insertNewObjectForEntityForName("Flashcard", inManagedObjectContext: context) as! Flashcard
    }
    
    func removeFlashcardFromContext() {
        if let flashcard = self.flashcard
        {
            if let moc = flashcard.managedObjectContext {
                moc.deleteObject(flashcard)
                //saveToPersistentStore()
            }
        }
    }
    
    
}