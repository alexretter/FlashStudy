//
//  ScoreCardViewController.swift
//  FlashStudy
//
//  Created by Alex Retter on 4/5/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit

class ScoreCardViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toQuestionList" {
            
        let destinationViewController = segue.destinationViewController as? HomeViewController
    }
}
    @IBAction func backToHomeButtonTapped(sender: AnyObject) {
        
        performSegueWithIdentifier("backToHome", sender: nil)
    }

}

