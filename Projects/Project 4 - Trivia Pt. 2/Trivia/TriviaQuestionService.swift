//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Melissa Gaines on 10/4/23.
//

import Foundation
class TriviaQuestionService {
    static func fetchTrivia(category: String,
                            difficulty: String,
                            amount: Int,
                            completion: ((TriviaQuestion) -> Void)? = nil) {
       /* if (category == "Randomized" && difficulty == "Randomized") {
            let parameters = "amount=\(amount)"
        }
        else if (category != "Randomized" && difficulty == "Randomized") {
            let parameters = "amount=\(amount)&category=\(category)"
        }
        else if (category == "Randomized" && difficulty != "Randomized") {
            let parameters = "amount=\(amount)&difficulty=\(difficulty)"
        }
        else {
        */
        let parameters = "amount=\(amount)&category=\(category)&difficulty=\(difficulty)"
      //      let url = URL(string: "https://api.open-meteo.com/v1/forecast?\(parameters)")!
        let url = URL(string: "https://opentdb.com/api.php?\(parameters)")!
            // create a data task and pass in the URL
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
              // this closure is fired when the response is received
              guard error == nil else {
                assertionFailure("Error: \(error!.localizedDescription)")
                return
              }
              guard let httpResponse = response as? HTTPURLResponse else {
                assertionFailure("Invalid response")
                return
              }
              guard let data = data, httpResponse.statusCode == 200 else {
                assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
                return
              }
              let response = try! JSONDecoder().decode(TriviaAPIResponse.self, from: data)
                for question in response.results {
                    DispatchQueue.main.async {
                        completion?(question)
                    }
                }
            }
            task.resume() // resume the task and fire the request

    }
    
      private static func parse(data: Data) -> TriviaQuestion {
          // transform the data we received into a dictionary [String: Any]
          let jsonDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
          let currentQuestion = jsonDictionary["results"] as! [String: Any]
          let category = currentQuestion["category"] as! String
          let difficulty = currentQuestion["difficulty"] as! String
          let question = currentQuestion["question"] as! String
          let correct_answer = currentQuestion["correct_answer"] as! String
          let incorrect_answers = currentQuestion["incorrect_answers"] as! [String]
          return TriviaQuestion(category: category,
                                difficulty: difficulty,
                                question: question,
                                correct_answer: correct_answer,
                                incorrect_answers: incorrect_answers)
      }
     
  }
