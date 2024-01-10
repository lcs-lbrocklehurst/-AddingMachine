//
//  QuizView.swift
//  AddingMachine
//
//  Created by Lewis Brocklehurst on 2024-01-10.
//

import SwiftUI

struct QuizView: View {
    
    @State var answerGiven = ""
    
    var body: some View {
        HStack {
            
            //Quiz interface
            VStack{
                HStack {
                    Spacer()
                    Text("12")
                        .font(.custom("Helvetica", size: 96.0))
                }
                HStack {
                    Spacer()
                    
                    Text("+")
                    Text("15")
                        
                }
                .font(.custom("Helvetica", size: 96.0))
                
                Divider()
                
                TextField("Answer", text: $answerGiven)
                    .font(.custom("Helvetica", size: 96.0))
                    .multilineTextAlignment(.trailing)
            }
            
            // List of past questions
            Text("History")
        }
        .frame(width: 800, height: 400)
    }
}

#Preview {
    QuizView()
}
