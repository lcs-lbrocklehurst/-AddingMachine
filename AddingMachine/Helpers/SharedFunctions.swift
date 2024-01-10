//
//  SharedFunctions.swift
//  AddingMachine
//
//  Created by Lewis Brocklehurst on 2024-01-10.
//

import Foundation

func filtering(providedHistory: [Question], on answerState: AnswerState) -> [Question] {
    
    // When answer state is "no input given" returnthe entire lis of questions
    if answerState == .noInputGiven{
        return providedHistory
    }
    
    // Otherwise, filter based on correct or incorrect
    var filteredHistory: [Question] = []
    for question in providedHistory{
        
        if question.result == answerState {
            // Add to the array to be returned
            filteredHistory.append(question)
        }
    }
    // Return the filtered array
    return filteredHistory
}
