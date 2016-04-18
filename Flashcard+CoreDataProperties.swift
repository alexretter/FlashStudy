//
//  Flashcard+CoreDataProperties.swift
//  FlashStudy
//
//  Created by Alex Retter on 4/18/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Flashcard {

    @NSManaged var question: String?
    @NSManaged var answer: String?
    @NSManaged var deck: Deck?

}
