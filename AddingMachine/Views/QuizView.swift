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
                    
                    TextField("Answer", text: $answerGiven)
                    
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
            Text("History")
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
         firstNumber = Int.random(in: 1...25)
         secondNumber = Int.random(in: 1...25)
         answerGiven = ""
         result = .noInputGiven

    }
}

#Preview {
    QuizView()
}
