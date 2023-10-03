//
//  GameViewController.swift
//  Trivia
//
//  Created by Melissa Gaines on 10/1/23.
//

// Import the UIKit framework
// You're almost always going to need this when your referencing UI elements in your file
import UIKit

// Class declaration, including the name of the class and its subclass (UIViewController)
class GameViewController: UIViewController {
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButtonA: UIButton!
    
    @IBOutlet weak var answerButtonB: UIButton!
    @IBOutlet weak var answerButtonC: UIButton!
    @IBOutlet weak var answerButtonD: UIButton!
    
    private var triviaQuestion = [GameData]() // tracks all the possible forecasts
    private var selectedTriviaIndex = 0 // tracks which forecast is being shown, defaults to 0
    override func viewDidLoad() {
        // Some functions require you to call the super class implementation
        // Always read the online documentation to know if you need to
        super.viewDidLoad()
        triviaQuestion = createMockData()
        //let fakeData = GameData(categoryCode: .music)
        configure(with: triviaQuestion[selectedTriviaIndex])
    }
    // Returns an array of fake WeatherForecast data models to show
    private func createMockData() -> [GameData] {
        // Create a few mock data to show
        let mockData1 = GameData(categoryCode: .music)
        let mockData2 = GameData(categoryCode: .science)
        let mockData3 = GameData(categoryCode: .math)
        return [mockData1, mockData2, mockData3]
    }
    private func configure(with game: GameData) {
        categoryIcon.image = game.categoryCode.image
        categoryName.text = game.categoryCode.category
        questionNum.text = String(selectedTriviaIndex+1)
        questionLabel.text = game.categoryCode.question
        
        answerButtonA.setTitle(game.categoryCode.answerA, for: .normal)
        answerButtonB.setTitle(game.categoryCode.answerB, for: .normal)
        answerButtonC.setTitle(game.categoryCode.answerC, for: .normal)
        answerButtonD.setTitle(game.categoryCode.answerD, for: .normal)
    }

    @IBAction func selectedButtonPressed(sender: UIButton) {
        if sender == answerButtonA {
            selectedTriviaIndex = min(triviaQuestion.count - 1, selectedTriviaIndex + 1) // don't go higher than the number of forecasts
            configure(with: triviaQuestion[selectedTriviaIndex]) // change the forecast shown in the UI
            
        } else if sender == answerButtonB {
            selectedTriviaIndex = min(triviaQuestion.count - 1, selectedTriviaIndex + 1) // don't go higher than the number of forecasts
            configure(with: triviaQuestion[selectedTriviaIndex]) // change the forecast shown in the UI
            
        } else if sender == answerButtonC {
            selectedTriviaIndex = min(triviaQuestion.count - 1, selectedTriviaIndex + 1) // don't go higher than the number of forecasts
            configure(with: triviaQuestion[selectedTriviaIndex]) // change the forecast shown in the UI
            
        }else if sender == answerButtonD {
            selectedTriviaIndex = min(triviaQuestion.count - 1, selectedTriviaIndex + 1) // don't go higher than the number of forecasts
            configure(with: triviaQuestion[selectedTriviaIndex]) // change the forecast shown in the UI
        }
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

