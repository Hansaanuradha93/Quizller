//
//  ViewController.swift
//  Qizller
//
//  Created by Hansa Anuradha on 11/21/18.
//  Copyright © 2018 Hansa Anuradha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create a QuestionBank object
    let allQuestions = QuestionBank()

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabbel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display question
        displayRandomQuestion()
    
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print(sender.tag)
        // Display question
        displayRandomQuestion()
    }
    
    
    func displayRandomQuestion() {
        // Create random index
        var randomIndex = Int.random(in: 0...12)
        // Set the randomly selected question text to the label
        questionLabel.text = allQuestions.list[randomIndex].questionText
    }
}

