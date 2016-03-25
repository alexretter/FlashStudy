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
    
    var decks: [Deck] = []
    var selectedDeck: Deck?
    
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
        let alertController = UIAlertController(title: "Deck Name", message: "", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField: UITextField!) in
            
            textField.placeholder = "Enter Deck Name..."
        }
        
        let setNameAction = UIAlertAction(title: "Set Name", style: .Default) { (_) -> Void in
            if let text = alertController.textFields?[0].text
            {
                let deck = Deck(name: text)
                self.decks.append(deck)
                self.deckTableView.reloadData()
            }
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(setNameAction)
        alertController.addAction(cancelButton)
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
       return decks.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedDeck = decks[indexPath.row]
    }
    
     func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            decks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("deckCell", forIndexPath: indexPath)
        
        let deck = decks[indexPath.row]
        cell.textLabel?.text = deck.name
        
        return cell
    }
}
