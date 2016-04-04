//
//  HomeViewController.swift
//  FlashStudy
//
//  Created by Alex Retter on 3/25/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    @IBOutlet weak var deckTableView: UITableView!
    
    var selectedDeck: Deck!
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addDeckButtonTapped(sender: UIButton) {
        let alertController = UIAlertController(title: "Name Your Study Guide!", message: "🤓", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField: UITextField!) in
            
            textField.placeholder = "Enter Deck Name..."
        }
        
        let setNameAction = UIAlertAction(title: "Set Name", style: .Default) { (_) -> Void in
            if let text = alertController.textFields?[0].text
            {
                let deck = DeckController.sharedController.insertDeckIntoContext(Stack.sharedStack.managedObjectContext)
                deck.name = text
                DeckController.sharedController.saveToPersistentStore()
                self.deckTableView.reloadData()
            }
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(setNameAction)
        alertController.addAction(cancelButton)
        alertController.preferredAction = setNameAction
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toQuestionList" {
            
            let destinationViewController = segue.destinationViewController as? QuestionsTableViewController
            destinationViewController?.deck = selectedDeck
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let decks = DeckController.sharedController.fetchAllDecksInContext(Stack.sharedStack.managedObjectContext)
        {
            return decks.count
        }
        else
        {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if let decks = DeckController.sharedController.fetchAllDecksInContext(Stack.sharedStack.managedObjectContext)
        {
            selectedDeck = decks[indexPath.row]
            self.performSegueWithIdentifier("toQuestionList", sender: nil)
        }
    }
    
     func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            
            if let decks = DeckController.sharedController.fetchAllDecksInContext(Stack.sharedStack.managedObjectContext)
            {
                let deck = decks[indexPath.row]
                DeckController.sharedController.removeDeckFromContext(deck, completion: { (success) -> Void in
                    print(success)
                    
                    if success {
                        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                    }
                })
            }
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("deckCell", forIndexPath: indexPath)

        if let decks = DeckController.sharedController.fetchAllDecksInContext(Stack.sharedStack.managedObjectContext)
        {
            let deck = decks[indexPath.row]
            cell.textLabel?.text = deck.name
        }
        
        return cell
    }
}
