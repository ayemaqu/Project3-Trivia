//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Ayema Qureshi on 3/13/24.
//

import UIKit

class TriviaViewController: UIViewController {
    
    //Add IBoutlets here
    @IBAction func option1Button(_ sender: UIButton) {
        handleOptionButtonTapped(optionIndex: 0)

    }
    @IBAction func option2Button(_ sender: UIButton) {
        handleOptionButtonTapped(optionIndex: 1)

    }
    @IBAction func option3Button(_ sender: UIButton) {
        handleOptionButtonTapped(optionIndex: 2)

    }
    @IBAction func option4Button(_ sender: UIButton) {
        handleOptionButtonTapped(optionIndex: 0)

    }
    @IBOutlet weak var questionNumLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var triviaQLabel: UILabel!

    private var trivia = [TriviaQuestion]() // Tracks all trivia questions
    private var selectedTriviaIndex = 0 // Tracks which question is being shown, defaults to 0
    private var score = 0
    private var totalQuestions = 0
    

        override func viewDidLoad() {
            super.viewDidLoad()
            trivia = createMockData()
            configure(with: trivia[selectedTriviaIndex]) // Configure the UI to show the first trivia question
            totalQuestions = trivia.count

        }
        
        @IBAction func optionButtonTapped(_ sender: UIButton) {
            // Increment the selectedTriviaIndex to switch to the next question
            selectedTriviaIndex = min(trivia.count - 1, selectedTriviaIndex + 1)
            
            // Check if there are more questions remaining
            if selectedTriviaIndex < trivia.count {
                configure(with: trivia[selectedTriviaIndex]) // Change the trivia question shown in the UI
            } else {
                // No more questions remaining
                // You can handle this case as per your requirement
                // For example, you can show a message or reset the quiz
                print("End of questions")
            }
        }
        
        private func createMockData() -> [TriviaQuestion] {
            let mockData1 = TriviaQuestion(
                question: "Who was the first champion in League of Legends?",
                options: ["Annie", "Ashe", "Nunu", "Sivir"],
                correctAnswerIndex: 0,
                category: .games
            )
            let mockData2 = TriviaQuestion(
                question: "Which is not a Pixar movie?",
                options: ["Toy Story", "Cars", "Shrek", "Lion King"],
                correctAnswerIndex: 2,
                category: .entertainment
            )
            let mockData3 = TriviaQuestion(
                question: "What year did the Titanic sink?",
                options: ["1912", "1915", "1918", "1920"],
                correctAnswerIndex: 0,
                category: .history
            )
            return [mockData1, mockData2, mockData3]
        }

        private func configure(with question: TriviaQuestion) {
            questionNumLabel.text = "Question \(selectedTriviaIndex + 1)"
            categoryLabel.text = "Category: \(question.category.description)"
            triviaQLabel.text = question.question
        }
    private func handleOptionButtonTapped(optionIndex: Int) {
        if optionIndex == trivia[selectedTriviaIndex].correctAnswerIndex {
            score += 1
        }
        
        if selectedTriviaIndex >= totalQuestions - 1 {
            showGameOverAlert()
        }
    }
    
    private func showGameOverAlert() {
            let alertController = UIAlertController(title: "Game Over!", message: "Final score: \(score)/\(totalQuestions)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.resetGame()
            }))
            self.present(alertController, animated: true, completion: nil)
        }
        
        private func resetGame() {
            selectedTriviaIndex = 0
            score = 0
            configure(with: trivia[selectedTriviaIndex])
        }
    }
