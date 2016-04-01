//
//  AddCardViewController.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {

    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerTextView: UITextView!
   
    var deck: Deck?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addCardButtonTapped(sender: AnyObject) {
       
        if let deck = self.deck
        {
            let card = FlashcardController.insertFlashcardIntoContext(deck.managedObjectContext!)
            card.question = questionTextView.text
            card.answer = answerTextView.text
            card.deck = deck
            
            questionTextView.text = ""
            answerTextView.text = ""
            
            questionTextView.becomeFirstResponder()
            FlashcardController.saveToPersistentStore()
        }
    }

}
