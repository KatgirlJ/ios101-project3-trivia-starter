//
//  ViewController.swift
//  Trivia
//
//  Created by Katrinna Jones on 9/16/26.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentQuestion()
        // Do any additional setup after loading the view.
    }
    
    var questionIndex = 0
    var score = 0
    
    // For question label
    @IBOutlet weak var questionNumLabel: UILabel!
    // For Type and Subtype label
    @IBOutlet weak var typeWithSubLabel: UILabel!
    // For the question itself
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    // For the question being displayed itself
    
    var correctAnswers = 0
    //If any button is pressed
    
    
    func displayCurrentQuestion(){
        let allQuestions = Questions.questionsAsked
        
        // Unwrapping all my IBOutlets
        guard questionIndex < allQuestions.count else{return}
        
        guard let numLabel = questionNumLabel else{return}
        guard let types = typeWithSubLabel else{return}
        guard let questions = questionLabel else{return}
        guard let answerButtons = answerButtons else{return}
        
        
        
        // Will keep us on track with the current question
        
        let currentQuestion = allQuestions[questionIndex]
        
        //Will ask the question and will change to new questions
        numLabel.text = "Question \(questionIndex + 1)/\(Questions.questionsAsked.count)"
        types.text = "\(currentQuestion.questionType) : \(currentQuestion.questionSubType)"
        questions.text = currentQuestion.question
        
        let answerChoices = currentQuestion.answers.keys.sorted()
        
        for (index, button) in answerButtons.enumerated(){
            if(index < currentQuestion.answers.count){
                button.isHidden = false
                button.setTitle(answerChoices[index], for: .normal)
            }
            else{
                button.isHidden = true
            }
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton){
        let allQuestions = Questions.questionsAsked
        guard questionIndex < allQuestions.count else { return }
        
        let currentQuestion = allQuestions[questionIndex]
        let answerChoices = currentQuestion.answers.keys.sorted()
        
        guard let buttonIndex = answerButtons.firstIndex(of: sender),
              buttonIndex < answerChoices.count else { return }
        
        let selectedAnswer = answerChoices[buttonIndex]
        
        if let isCorrect = currentQuestion.answers[selectedAnswer], isCorrect{
            score+=1
        }
        questionIndex+=1
        
        if questionIndex < allQuestions.count{
            displayCurrentQuestion()
        }
        else{
            showTotalScore()
        }
    }
    
    func showTotalScore(){
        questionLabel.text = "Congratulations your final score is \(score)/\(Questions.questionsAsked.count)"
        typeWithSubLabel.text = ""
        //for (index, button) in answerButtons.enumerated(){
        for button in answerButtons {
            button.isHidden = true
        }
    }
            
    //}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}


    


