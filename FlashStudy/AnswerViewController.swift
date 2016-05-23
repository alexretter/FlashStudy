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
    
    var flashcards: [Flashcard] = []
    var knownCards: [Flashcard] = []
    var unknownCards: [Flashcard] = []
   // var tempFlashcardsArray: [Flashcard] = []
    
    var randomIndex = 0
    
    var deck: Deck!
    
    var card: Flashcard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        
        //self.tempFlashcardsArray = deck.flashcards
        randomIndex = Int(arc4random_uniform(UInt32(flashcards.count)))
        //card = tempFlashcardsArray[randomIndex]
        
        if let card = card {
            
            questionLabel.text = card.question
            answerLabel.text = card.answer
        }
        
        self.answerLabel.hidden = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  /*  @IBAction func repeatCardButtonTapped(sender: AnyObject) {
        if let card = self.card
        {
            tempFlashcardsArray.removeAtIndex(randomIndex)
            unknownCards.append(card)
            if tempFlashcardsArray.count == 0 {
                let alertController = UIAlertController(title: "You have completed your deck!", message: "Click Below for Score! 👏🏻", preferredStyle: .Alert)
                let getScoreButton = UIAlertAction(title: "Get Score!", style: .Default, handler: { (_) -> Void in
                    self.performSegueWithIdentifier("toScoreCard", sender: nil)
                })
                alertController.addAction(getScoreButton)
                self.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                goToNextCard()
            }
        }
    } */
    
    @IBAction func revealAnswerButtonTapped(sender: AnyObject) {
        
        self.answerLabel.hidden = false
        
        answerLabel.text = flashcards[randomIndex].answer
        
    }
    @IBAction func nextQuestionButtonTapped(sender: AnyObject) {
        if let card = self.card
        {
            flashcards.removeAtIndex(randomIndex)
            knownCards.append(card)
            if flashcards.count == 0 {
                let alertController = UIAlertController(title: "You have completed your deck!", message: "Click below to view your decks!", preferredStyle: .Alert)
                let ViewDecks = UIAlertAction(title: "Good Job!", style: .Default, handler: { (_) -> Void in
                    self.performSegueWithIdentifier("toHome", sender: nil)
                })
                //alertController.addAction(getScoreButton)
                self.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                goToNextCard()
            }
        }
    }
    
    func goToNextCard()
    {
        randomIndex = Int(arc4random_uniform(UInt32(flashcards.count)))
        let card = flashcards[randomIndex]
        questionLabel.text = card.question
        answerLabel.text = card.answer
        answerLabel.hidden = true
    }
    
    func deckComplete() {
        
        
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toScoreCard"
        {
            let scoreCardVC = segue.destinationViewController as! ScoreCardViewController
            scoreCardVC.knownCards = self.knownCards
            scoreCardVC.unknownCards = self.unknownCards
        }
    } */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toHome" {
            
            let homeVC = segue.destinationViewController as! HomeViewController
            
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
}


