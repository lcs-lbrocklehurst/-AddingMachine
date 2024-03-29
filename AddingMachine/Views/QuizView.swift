//
//  QuizView.swift
//  AddingMachine
//
//  Created by Lewis Brocklehurst on 2024-01-10.
//

import SwiftUI

struct QuizView: View {
    //MARK: Stored properties
    @State var firstNumber = Int.random(in: 1...25)
    @State var secondNumber = Int.random(in: 1...25)
    @State var answerGiven = ""
    @State var result: AnswerState = .noInputGiven
    
    // List of prior questions
    @State var history: [Question] = [] // Empty to start
    
    // Keep track of filtering option user has selected
    @State var filteringOption: AnswerState = .noInputGiven // Everything
    // MARK: Computed properties
    var body: some View {
        HStack {
            
            //Quiz interface
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    Text("\(firstNumber)")
                        .font(.custom("Helvetica", size: 96.0))
                }
                HStack {
                    Text("+")
                    
                    Spacer()
                    
                    Text("\(secondNumber)")
                    
                }
                .font(.custom("Helvetica", size: 96.0))
                
                Divider()
                
                HStack {
                    Text(result.rawValue)
                        .padding(20)
                    
                    TextField("", text: $answerGiven)
                    
                        .multilineTextAlignment(.trailing)
                        .padding(.leading)
                }
                .font(.custom("Helvetica", size: 96.0))
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        checkAnswer()
                    }, label: {
                        Text("Submit")
                    })
                    
                    Button(action: {
                        newQuestion()
                    }, label: {
                        Text("New Question")
                    })
                    
                }
            }
            
            
            // List of past questions
            VStack {
                
                // Picker to select the fitlering type
                Picker("Filtering on...", selection: $filteringOption) {
                    Text("nothing (show all questions)")
                        .tag(AnswerState.noInputGiven)
                    Text("correct")
                        .tag(AnswerState.correct)
                    Text("incorrect")
                        .tag(AnswerState.incorrect)
                }
                
                // The list of questions
                List(
                    filtering(providedHistory: history, on: filteringOption)
                ) { currentQuestion in
                    HStack {
                        Text("\(currentQuestion.firstNumber) + \(currentQuestion.secondNumber) = \(currentQuestion.answerGiven) (\(currentQuestion.firstNumber + currentQuestion.secondNumber)) \(currentQuestion.result.rawValue)")
                    }
                }
            }
        }
        .frame(width: 800, height: 400)
    }
    
    // MARK: functions
    func checkAnswer() {
        let correctAnswer = firstNumber + secondNumber
        
        // Try to make the answer given into an integer
        guard let answerGivenAsInteger = Int(answerGiven)
        else {
            // Can't make input ino an integer
            return
        }
        
        if answerGivenAsInteger == correctAnswer {
            // Tell the user they got it right
            result = .correct
        } else {
            result = .incorrect
        }
    }
    
    func newQuestion() {
        
        // Save the question just completed
        let oldQuestion = Question(
            firstNumber: firstNumber,
            secondNumber: secondNumber,
            answerGiven: answerGiven,
            result: result
        )
        
        
        // Add it to the history
        history.insert(oldQuestion, at: 0)
        // Resets everything
         firstNumber = Int.random(in: 1...25)
         secondNumber = Int.random(in: 1...25)
         answerGiven = ""
         result = .noInputGiven

    }
}

#Preview {
    QuizView()
}
