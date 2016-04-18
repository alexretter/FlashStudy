//
//  Flashcard.swift
//  FlashStudy
//
//  Created by Alex Retter on 4/18/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation
import CoreData


class Flashcard: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    convenience init(question: String, answer: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Flashcard", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.question = question
        self.answer = answer
    }
}
