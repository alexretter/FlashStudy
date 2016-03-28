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
    
    var deck: Deck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cards = deck.deckOfFlashcards
        
        //questionLabel.text = deck.deckOfFlashcards
        
        self.answerLabel.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func repeatCardButtonTapped(sender: AnyObject) {
        
    }

    @IBAction func revealAnswerButtonTapped(sender: AnyObject) {
    
        self.answerLabel.hidden = false
        
    }
}
