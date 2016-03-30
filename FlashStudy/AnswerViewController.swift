//
//  AnswerViewController.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var answerLabel: UILabel!
    
    var randomIndex = 0
    
    var deck: Deck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomIndex = Int(arc4random_uniform(UInt32(deck.flashcards.count)))
        
        let card = deck.flashcards[randomIndex]
        
        questionLabel.text = card.question
        answerLabel.text = card.answer
        
        self.answerLabel.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*@IBAction func repeatCardButtonTapped(sender: AnyObject) {
        deck.unknownCards.append(deck.deckOfFlashcards[randomIndex])
        goToNextCard()
    }*/

    @IBAction func revealAnswerButtonTapped(sender: AnyObject) {
    
        self.answerLabel.hidden = false
        
        answerLabel.text = deck.flashcards[randomIndex].answer
        
    }
    @IBAction func nextQuestionButtonTapped(sender: AnyObject) {
    
        goToNextCard()
    }
    
    func goToNextCard() {
        randomIndex = Int(arc4random_uniform(UInt32(deck.flashcards.count)))
        let card = deck.flashcards[randomIndex]
        questionLabel.text = card.question
        answerLabel.text = card.answer
        answerLabel.hidden = true
    }
    
}
