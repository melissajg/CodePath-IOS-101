//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Melissa Gaines on 10/4/23.
//

import Foundation
class TriviaQuestionService {
    static func fetchTrivia(amount: Int,
                            completion: ((TriviaQuestion) -> Void)? = nil) {
        let parameters = "amount=\(amount)"
      //      let url = URL(string: "https://api.open-meteo.com/v1/forecast?\(parameters)")!
        let url = URL(string: "https://opentdb.com/api.php?amount=10")!
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
              let decoder = JSONDecoder()
              let response = try! decoder.decode(TriviaAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    completion?(response.currentQuestion)
                }
            }
            task.resume() // resume the task and fire the request

    }
    /*
      private static func parse(data: Data) -> TriviaQuestion {
          // transform the data we received into a dictionary [String: Any]
          let jsonDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
          let currentQuestion = jsonDictionary["current_weather"] as! [String: Any]
          // wind speed
          let windSpeed = currentWeather["windspeed"] as! Double
          // wind direction
          let windDirection = currentWeather["winddirection"] as! Double
          // temperature
          let temperature = currentWeather["temperature"] as! Double
          // weather code
          let weatherCodeRaw = currentWeather["weathercode"] as! Int
          return TriviaQuestion(windSpeed: windSpeed,
                                        windDirection: windDirection,
                                        temperature: temperature,
                                        weatherCodeRaw: weatherCodeRaw)
      }
     */
  }
