//
//  ViewController.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import UIKit
struct Question {
    let amount : Int
}
class TriviaViewController: UIViewController {
  
  @IBOutlet weak var currentQuestionNumberLabel: UILabel!
  @IBOutlet weak var questionContainerView: UIView!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var answerButton0: UIButton!
  @IBOutlet weak var answerButton1: UIButton!
  @IBOutlet weak var answerButton2: UIButton!
  @IBOutlet weak var answerButton3: UIButton!
  
  private var questions = [Question]()
  private var currQuestionIndex = 0
  private var numCorrectQuestions = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addGradient()
    questionContainerView.layer.cornerRadius = 8.0
    // TODO: FETCH TRIVIA QUESTIONS HERE
      let question1 = Question(amount: 1)
      let question2 = Question(amount: 1)
      let question3 = Question(amount: 1)
      questions = [question1,question2,question3]
      
    updateQuestion(withQuestionIndex: 0)
  }
    private func updateQuestion(withQuestionIndex questionIndex: Int) {
        guard questionIndex < questions.count else { return }
        let question = questions[questionIndex]
        TriviaQuestionService.fetchTrivia(amount: question.amount) {
            trivia in self.configure(with: trivia, withQuestionIndex: questionIndex)
            }
    }
    private func configure(with trivia: TriviaQuestions, withQuestionIndex questionIndex: Int) {
        currentQuestionNumberLabel.text = "Question: \(questionIndex + 1)/\(questions.count)"
        questionLabel.text = trivia.question
        categoryLabel.text = trivia.category
          // combine array of answers (right and wrong) and shuffle them
        let answers = ([trivia.correct_answer] + trivia.incorrect_answers).shuffled()
          print(answers.count)
          
        // made all the button hidden
        answerButton0.isHidden = true
        answerButton1.isHidden = true
        answerButton2.isHidden = true
        answerButton3.isHidden = true
        // if theres atleast one answer show first button
        if answers.count > 0 {
          answerButton0.setTitle(answers[0], for: .normal)
            answerButton0.isHidden = false
        }
          // if theres atleast 2 answers show first two buttons
        if answers.count > 1 {
          answerButton1.setTitle(answers[1], for: .normal)
          answerButton1.isHidden = false
        }
          // if theres atleast one answer show first three buttons
        if answers.count > 2 {
          answerButton2.setTitle(answers[2], for: .normal)
          answerButton2.isHidden = false
        }
          // if theres atleast one answer show all four buttons
        if answers.count > 3 {
          answerButton3.setTitle(answers[3], for: .normal)
          answerButton3.isHidden = false
        }
    }
  private func updateToNextQuestion(answer: String) {
      numCorrectQuestions += 1
   /* if isCorrectAnswer(answer) {
      numCorrectQuestions += 1
    }
    */
      
    currQuestionIndex += 1
    guard currQuestionIndex < questions.count else {
      showFinalScore()
      return
    }
    updateQuestion(withQuestionIndex: currQuestionIndex)
  }
  /*
  private func isCorrectAnswer(_ answer: String) -> Bool {
    return answer == questions[currQuestionIndex].correctAnswer
  }
   */
  
  private func showFinalScore() {
    let alertController = UIAlertController(title: "Game over!",
                                            message: "Final score: \(numCorrectQuestions)/\(questions.count)",
                                            preferredStyle: .alert)
    let resetAction = UIAlertAction(title: "Restart", style: .default) { [unowned self] _ in
      currQuestionIndex = 0
      numCorrectQuestions = 0
      updateQuestion(withQuestionIndex: currQuestionIndex)
    }
    alertController.addAction(resetAction)
    present(alertController, animated: true, completion: nil)
  }
  
  private func addGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [UIColor(red: 0.54, green: 0.88, blue: 0.99, alpha: 1.00).cgColor,
                            UIColor(red: 0.51, green: 0.81, blue: 0.97, alpha: 1.00).cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
    view.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  @IBAction func didTapAnswerButton0(_ sender: UIButton) {
    updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton1(_ sender: UIButton) {
    updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton2(_ sender: UIButton) {
    updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton3(_ sender: UIButton) {
    updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
  }
     
}

