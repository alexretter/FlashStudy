//
//  DeckController.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation
import CoreData

class DeckController {
   
    static let sharedController = DeckController()
    
    var deck: Deck?
    
    func fetchAllDecksInContext(context: NSManagedObjectContext) -> [Deck]? {
        
        let request = NSFetchRequest(entityName: "Deck")
        
        do {
            
            let decks = try context.executeFetchRequest(request) as! [Deck]
            print("FETCHING ALL DECKS SUCCEEDED")
            return decks
            
        } catch {
            
            print("FETCHING ALL DECKS DID NOT SUCCEED")
            return []
        }
    }
    
    func saveToPersistentStore() {
        
       // let moc = Stack.sharedStack.managedObjectContext
        do {
            try Stack.sharedStack.managedObjectContext.save()
            print("SUCCESS SAVING")
        } catch let error as NSError {
            print("Error saving \(error.localizedDescription) -> \(__FUNCTION__)")
        }
    }
    
    func insertDeckIntoContext(context: NSManagedObjectContext) -> Deck {
        return NSEntityDescription.insertNewObjectForEntityForName("Deck", inManagedObjectContext: context) as! Deck
    }
    
    func removeDeckFromContext(deck: Deck) {
        if let moc = deck.managedObjectContext {
                moc.deleteObject(deck)
                saveToPersistentStore()
        }
    }
    
}


