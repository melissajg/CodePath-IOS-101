//
//  ViewController.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import UIKit

class TriviaViewController: UIViewController {
  
  @IBOutlet weak var currentQuestionNumberLabel: UILabel!
  @IBOutlet weak var questionContainerView: UIView!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var answerButton0: UIButton!
  @IBOutlet weak var answerButton1: UIButton!
  @IBOutlet weak var answerButton2: UIButton!
  @IBOutlet weak var answerButton3: UIButton!
    private var correctAnswersList: [String] = []
    private var questionAmount: Int = 5
  private var currQuestionIndex: Int = 0
  private var numCorrectQuestions: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addGradient()
    questionContainerView.layer.cornerRadius = 8.0
    updateQuestion(withQuestionIndex: 0)
  }
    private func updateQuestion(withQuestionIndex questionIndex: Int) {
        guard questionIndex < questionAmount else { return }
        TriviaQuestionService.fetchTrivia(amount: 1) {
            trivia in self.configure(with: trivia, withQuestionIndex: questionIndex)
            }
    }
    private func configure(with trivia: TriviaQuestion, withQuestionIndex questionIndex: Int) {
        currentQuestionNumberLabel.text = "Question: \(questionIndex + 1)/\(questionAmount)"
        questionLabel.text = trivia.question.htmlDecoded
        categoryLabel.text = trivia.category.htmlDecoded
          // combine array of answers (right and wrong) and shuffle them
        let answers = ([trivia.correct_answer] + trivia.incorrect_answers).shuffled()
        correctAnswersList.append(trivia.correct_answer)
        // made all the button hidden
        answerButton0.isHidden = true
        answerButton1.isHidden = true
        answerButton2.isHidden = true
        answerButton3.isHidden = true
        // if theres atleast one answer show first button
        if answers.count > 0 {
            answerButton0.setTitle(answers[0].htmlDecoded, for: .normal)
            answerButton0.isHidden = false
        }
          // if theres atleast 2 answers show first two buttons
        if answers.count > 1 {
            answerButton1.setTitle(answers[1].htmlDecoded, for: .normal)
          answerButton1.isHidden = false
        }
          // if theres atleast one answer show first three buttons
        if answers.count > 2 {
            answerButton2.setTitle(answers[2].htmlDecoded, for: .normal)
          answerButton2.isHidden = false
        }
          // if theres atleast one answer show all four buttons
        if answers.count > 3 {
            answerButton3.setTitle(answers[3].htmlDecoded, for: .normal)
          answerButton3.isHidden = false
        }
        
    }

    private func fixEntityCodes(with triviaDetail: String) -> String {
        
        if (triviaDetail.contains("&quot;")){
            return triviaDetail.replacingOccurrences(of: "&quot;", with: "\u{22}")
        }
        if (triviaDetail.contains("&#039;")){
            return triviaDetail.replacingOccurrences(of: "&#039;", with: "\u{27}")
        }
        if (triviaDetail.contains("&eacute;")){
            return triviaDetail.replacingOccurrences(of: "&eacute;", with: "\u{e9}")
        }
        if (triviaDetail.contains("&Idquo")){
            return triviaDetail.replacingOccurrences(of: "&eacute;", with: "\u{e9}")
        }
        if (triviaDetail.contains("&rdquo;")){
            return triviaDetail.replacingOccurrences(of: "&eacute;", with: "\u{e9}")
        }
        if (triviaDetail.contains("&rdquo;")){
            return triviaDetail.replacingOccurrences(of: "&eacute;", with: "\u{e9}")
        }
        else{
            return triviaDetail
        }
        
    }
    private func updateToNextQuestion(_ chosenAnswer: String) {
      if isCorrectAnswer(correctAnswersList, currQuestionIndex, chosenAnswer) {
          numCorrectQuestions += 1
      }
    currQuestionIndex += 1
    guard currQuestionIndex < questionAmount else {
      showFinalScore()
      return
    }
    updateQuestion(withQuestionIndex: currQuestionIndex)
  }
  
    private func isCorrectAnswer(_ correctAnswersList: [String], _ currQuestionIndex: Int, _ chosenAnswer: String) -> Bool {
        print("Chosen answer: \(chosenAnswer), Correct answer: \(correctAnswersList[currQuestionIndex])")
        print("correctAnswers full: ", correctAnswersList)
        if ( correctAnswersList.count - 1 >= currQuestionIndex) {
            return chosenAnswer == correctAnswersList[currQuestionIndex]
        }
        else{
            return false
        }
  }

  
  private func showFinalScore() {
    let alertController = UIAlertController(title: "Game over!",
                                            message: "Final score: \(numCorrectQuestions)/\(questionAmount)",
                                            preferredStyle: .alert)
    let resetAction = UIAlertAction(title: "Restart", style: .default) { [unowned self] _ in
        currQuestionIndex = 0
        numCorrectQuestions = 0
        correctAnswersList.removeAll()
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
  
  @IBAction func didTapAnswerButton0( _ sender: UIButton) {
    updateToNextQuestion(sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton1(_ sender: UIButton) {
    updateToNextQuestion(sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton2(_ sender: UIButton) {
    updateToNextQuestion(sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton3(_ sender: UIButton) {
      updateToNextQuestion(sender.titleLabel?.text ?? "")
  }
    
     
}
// https://stackoverflow.com/questions/25607247/how-do-i-decode-html-entities-in-swift
extension String {
    var htmlDecoded: String {
        let decoded = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil).string

        return decoded ?? self
    }
}
