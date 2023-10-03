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
        case .science:
            return "Science"
        case .math:
            return "Math"
        }
        
    }
    var question: String {
        switch self {
        case .history:
            return "Who invent peanut butter?" // Correct Answer - A. Marcellus Gilmore Edson
        case .music:
            return "Who wrote 'I Will Always Love You'?" //Correct Answer - B. Dolly Parton
        case .geography:
            return "How many countentients are there?" // Correct Answer - C. 7
        case .science:
            return "What is the powerhouse of the cell?" // Correct Answer - D. Mitochondrie
        case .math:
            return "10+9?" // Correct Answer - A. 21
        }
        
    }
    var answerA: String {
        switch self {
        case .history:
            return "Marcellus Gilmore Edson" // Correct Answer
        case .music:
            return "Beyonce"
        case .geography:
            return "3"
        case .science:
            return "Cell wall"
        case .math:
            return "21" // Correct Answer
        }
    }
    var answerB: String {
        switch self {
        case .history:
            return "George Washington"
        case .music:
            return "Dolly Parton" // Correct Answer
        case .geography:
            return "8"
        case .science:
            return "Organelle"
        case .math:
            return "19"
        }
    }
    var answerC: String {
        switch self {
        case .history:
            return "Henrietta Lacks"
        case .music:
            return "Lucy Thomas"
        case .geography:
            return "7" // Correct Answer
        case .science:
            return "Cellulose"
        case .math:
            return "4"
        }
    }
    var answerD: String {
        switch self {
        case .history:
            return "Madam C. J. Walker"
        case .music:
            return "Dave Fenley"
        case .geography:
            return "3"
        case .science:
            return "Mitochondria" // Correct Answer
        case .math:
            return "100"
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
        case .science:
            return UIImage(named: "beaker")
        case .math:
            return UIImage(named: "numbers")
        }
    }
}

