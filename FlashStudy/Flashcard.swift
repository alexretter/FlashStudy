//
//  Flashcard.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/29/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation
import CoreData


class Flashcard: NSManagedObject {

    convenience init(question: String, answer: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Flashcard", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.question = question
        self.answer = answer
    }
    

}
