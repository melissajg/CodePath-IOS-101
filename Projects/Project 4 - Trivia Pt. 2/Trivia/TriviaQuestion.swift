//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation

struct TriviaAPIResponse: Decodable {
  let results: [TriviaQuestion]

}
struct TriviaQuestion: Decodable {
    let category : String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}
