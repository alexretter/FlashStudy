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
   
    var deck: Deck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false

        deck = Deck(name: "my deck")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addCardButtonTapped(sender: AnyObject) {
       
        let newCard = FlashcardController.createCard(questionTextView.text, answerText: answerTextView.text)
        
        self.deck.deckOfFlashcards.append(newCard)
        
        questionTextView.text = ""
        answerTextView.text = ""
        
        
        
    }

    @IBAction func createDeckButtonTapped(sender: AnyObject) {
        
        
    }
}
