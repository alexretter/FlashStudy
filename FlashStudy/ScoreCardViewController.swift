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

    var unknownCards: [Flashcard]?
    var knownCards: [Flashcard]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        if let known = self.knownCards, let unknown = self.unknownCards
        {
            let score = QuizController.scoreCardsKnown(known, unknownCards: unknown)
            scoreLabel.text = "\(score)%"
        }

    }
    
    @IBAction func backToHomeButtonTapped(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}

