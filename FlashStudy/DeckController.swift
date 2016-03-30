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
    
    func fetchAllDecksInContext() -> [Deck] {
        
        let request = NSFetchRequest(entityName: "Deck")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            
            return try moc.executeFetchRequest(request) as! [Deck]
            
        } catch {
            
            return []
        }
    }
    
    func saveToPersistentStore() {
        
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving \(error)")
        }
    }
    
    static func insertDeckIntoContext(context: NSManagedObjectContext) -> Deck {
        
      return NSEntityDescription.insertNewObjectForEntityForName("Deck", inManagedObjectContext: context) as! Deck
    
    }
    
    func removeDeckFromContext() {
        
        if let deck = deck {
            if let moc = deck.managedObjectContext {
                moc.deleteObject(deck)
                saveToPersistentStore()
            }
            
        }
    }
    
}


