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
    var pickedAnswer : Bool = false
    
    // Create a random index to select a random question
    var randomIndex : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabbel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start over the app by displaying a new question
        startOver()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        // Check answer
        checkAnswer()
        
        // Start over the app by displaying a new question
        startOver()
    }
    
    func startOver() {
        // Create a random index
        randomIndex = Int.random(in: 0...12)
        
        // Select a random question
        let selectedQuestion : Question = allQuestions.list[randomIndex]
        
        // Set the new question text to a label
        questionLabel.text = selectedQuestion.questionText
    }
    
    func checkAnswer() {
        
        // Get the correct answer
        let correctAnswer = allQuestions.list[randomIndex].answer
        
        if pickedAnswer == correctAnswer{
            print("You got it!!")
        }
        else if pickedAnswer != correctAnswer{
            print("Wrong")
        }
    }
    
    
    
    
    
}

