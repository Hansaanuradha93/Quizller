//
//  ViewController.swift
//  Qizller
//
//  Created by Hansa Anuradha on 11/21/18.
//  Copyright © 2018 Hansa Anuradha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties to store scores
    var numberOfQuestionsCorrect: Int = 0
    var numberOfAllQuestionAnswered: Int = 0
    var scoreLavel: Int = 0
    var progress : Float = 0

    
    // Create a QuestionBank object
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    
    // Create a random index to select a random question
    var randomIndex : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start over the app by displaying a new question
        nextQuestion()
        
        // Update Scores to 0
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        // Check answer
        let selectedAnswer = checkAnswer()
        
        // Update score when answered
        updateUI(answer: selectedAnswer)
        
        // Start over the app by displaying a new question
        nextQuestion()
        
    }
    
    func restart()  {
        // Restart the questions
        numberOfAllQuestionAnswered = 0
        scoreLavel = 0
        numberOfQuestionsCorrect = 0
        
        // Set progress label
        progressLabel.text = "\(numberOfQuestionsCorrect) / \(numberOfAllQuestionAnswered)"
        // Set score label
        scoreLabel.text = "Score: \(scoreLavel)"
        
        // Set progress bar to 0
        progress = 0
        progressView.setProgress(progress, animated: true)

        
        print("Game Restarted!")
    }

    
    func nextQuestion() {
        // Create a random index
        randomIndex = Int.random(in: 0...12)
        
        // Select a random question
        let selectedQuestion : Question = allQuestions.list[randomIndex]
        
        // Set the new question text to a label
        questionLabel.text = selectedQuestion.questionText
    }
    
    func checkAnswer() -> Bool{
        
        // Get the correct answer
        let correctAnswer = allQuestions.list[randomIndex].answer
        
        // Increase the value of numberOfAllQuestionAnswered by 1
        numberOfAllQuestionAnswered += 1
        
        if pickedAnswer == correctAnswer{
            print("You got it!!")
            // Increase score and progress when answer is correct
            numberOfQuestionsCorrect += 1
            scoreLavel += 20
            return true
        }
        else if pickedAnswer != correctAnswer{
            print("Wrong")
            return false
        }
        
        
        
        return false
    }
    
    func updateUI(answer : Bool? = nil) {
        
        if answer != nil {           
            
            progress += 1 / 13
            // If user has faced 15 questions, give them the chance to end the game or restart it
            if numberOfAllQuestionAnswered > 12{
                
                // Game Over!
                print("Game Over!")

                // Display alert message to the user
                let alert = UIAlertController(title: "Awesome", message: "You have faced 15 questions already, do you want to start over?", preferredStyle: .alert)
                
                let restart = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                    // Restart the questions
                    self.restart()
                }
                
                // Add alert action to the alert
                alert.addAction(restart)
                
                // Present the alert
                present(alert, animated: true, completion: nil)
                
            }
            
        } else {
            progress += 0

        }
        
        // Set progress label
        progressLabel.text = "\(numberOfQuestionsCorrect) / \(numberOfAllQuestionAnswered)"
        // Set score label
        scoreLabel.text = "Score: \(scoreLavel)"
        
        // Set progress view
        progressView.setProgress(progress, animated: true)
        
        
    }
    
    

    
}

