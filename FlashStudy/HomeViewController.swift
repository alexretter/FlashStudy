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
    var decks: [Deck]?
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
        getDecks()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDecks()
    {
        self.decks = DeckController.sharedController.fetchAllDecksInContext(Stack.sharedStack.managedObjectContext)
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
                self.getDecks()
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
        if let decks = self.decks
        {
            return decks.count
        }
        else
        {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let decks = self.decks
        {
            selectedDeck = decks[indexPath.row]
            self.performSegueWithIdentifier("toQuestionList", sender: nil)
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            if let decks = self.decks
            {
                DeckController.sharedController.removeDeckFromContext(decks[indexPath.row])
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("deckCell", forIndexPath: indexPath)
        
        if let decks = self.decks
        {
            let deck = decks[indexPath.row]
            cell.textLabel?.text = deck.name
        }
        
        return cell
    }
}
