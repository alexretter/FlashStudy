//
//  Flashcard.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation

class Flashcard {

    var question: String
    var answer: String
    
    init(question:String, answer:String) {
        
        self.question = question
        self.answer = answer
    }
}