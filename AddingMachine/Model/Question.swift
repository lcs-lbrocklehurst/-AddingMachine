//
//  Question.swift
//  AddingMachine
//
//  Created by Lewis Brocklehurst on 2024-01-10.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let firstNumber: Int
    let secondNumber: Int
    let answerGiven: String
    let result: AnswerState
}
