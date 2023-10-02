//
//  GameData.swift
//  Trivia
//
//  Created by Melissa Gaines on 10/1/23.
//

import Foundation
import UIKit

struct GameData {
    let categoryCode: CategoryCode

}
enum CategoryCode {
    case history
    case music
    case geography
    case sports
    case film
    case science
    case math
    
    var category: String {
        switch self {
        case .history:
            return "History"
        case .music:
            return "Music"
        case .geography:
            return "Geography"
        case .sports:
            return "Sports"
        case .film:
            return "Film"
        case .science:
            return "Science"
        case .math:
            return "Math"
        }
        
    }
    var question: String {
        switch self {
        case .history:
            return "Who invent peanut butter?"
        case .music:
            return "Who wrote 'I Will Always Love You'?"
        case .geography:
            return "How many countentients are there?"
        case .sports:
            return "football"
        case .film:
            return "film"
        case .science:
            return "science"
        case .math:
            return "math"
        }
        
    }
    var image: UIImage? {
        switch self {
        case .history:
            return UIImage(named: "book")
        case .music:
            return UIImage(named: "music-note")
        case .geography:
            return UIImage(named: "globe")
        case .sports:
            return UIImage(named: "football")
        case .film:
            return UIImage(named: "film-strip")
        case .science:
            return UIImage(named: "beaker")
        case .math:
            return UIImage(named: "numbers")
        }
    }
}

