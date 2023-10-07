//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation

struct TriviaAPIResponse: Decodable {
  var results: [TriviaQuestions]
}
struct TriviaQuestions: Decodable {
    var category : String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}
