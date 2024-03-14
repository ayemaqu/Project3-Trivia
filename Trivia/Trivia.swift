//
//  Trivia.swift
//  Trivia
//
//  Created by Ayema Qureshi on 3/13/24.
//

import Foundation
import UIKit


struct TriviaQuestion {
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
    let category: TriviaCategory
}

enum TriviaCategory {
    case games
    case entertainment
    case history
    // Add more categories as needed

    var description: String {
        switch self {
        case .games:
            return "Video Games"
        case .entertainment:
            return "Entertainment"
        case .history:
            return "History"
        }
    }
}

struct Trivia {
    static let questions: [TriviaQuestion] = [
        TriviaQuestion(question: "Who was the first champion in League of Legends?", options: ["Annie", "Ashe", "Nunu", "Sivir"], correctAnswerIndex: 0, category: .games),
        TriviaQuestion(question: "Which is not a Pixar movie?", options: ["Toy Story", "Cars", "Shrek", "Lion King"], correctAnswerIndex: 2, category: .entertainment),
        TriviaQuestion(question: "What year did the Titanic sink?", options: ["1912", "1915", "1918", "1920"], correctAnswerIndex: 0, category: .history),
    ]
}
