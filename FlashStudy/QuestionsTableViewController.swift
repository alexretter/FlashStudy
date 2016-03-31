//
//  QuestionsTableViewController.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController {

    var deck: Deck?
    
    @IBOutlet weak var quizMeButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if deck?.flashcards.count >= 1 {
            
            quizMeButton.userInteractionEnabled = true
        
        } else {
            
            let alertController = UIAlertController(title: "Oops", message: "You must enter questions to be quizzed on!", preferredStyle: .Alert)
            let okButton = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(okButton)
        }
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationController?.navigationBarHidden = false
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let deck = deck {
            return deck.flashcards.count
        } else {
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("questionCell", forIndexPath: indexPath)

        // Configure the cell...
        
        //let flashcards = deck?.flashcards
        let flashcard = deck!.flashcards[indexPath.row]
        cell.textLabel?.text = flashcard.question

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAddCard"
        {
         let destinationViewController = segue.destinationViewController as? AddCardViewController
            destinationViewController?.deck = self.deck
        }
        if segue.identifier == "toFlashCard" {
            
            let destinationViewController = segue.destinationViewController as? AnswerViewController
            destinationViewController!.deck = self.deck

        }
    }
   
    @IBAction func takeQuizButtonTapped(sender: AnyObject) {
       
        self.performSegueWithIdentifier("toFlashCard", sender: nil)
    }

}





