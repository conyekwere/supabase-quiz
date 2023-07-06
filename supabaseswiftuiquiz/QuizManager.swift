//
//  QuizManager.swift
//  supabaseswiftuiquiz
//
//  Created by Chima onyekwere on 7/4/23.
//

import SwiftUI
import Foundation
import Supabase

class QuizMangager:ObservableObject{
    @Published var mockQuestions = [
        Question(title: " When was the iPhone first released?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: " When was the iP?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: "  iPhone first released?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: " last?", answer: "A", choices: ["A","B","C","D"])
    ]
    let client = SupabaseClient(supabaseURL: URL(string: "https://gbspfpgyitcipubditgo.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdic3BmcGd5aXRjaXB1YmRpdGdvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg1MDE3NDEsImV4cCI6MjAwNDA3Nzc0MX0.LOjNnNdYx55paXrbpBJ3CxIuRqhhtIIBzDarRWwek5A")
    func canSubmitQuiz() -> Bool{

        return mockQuestions.filter({$0.selection == nil }).isEmpty
        
    }
    func gradeQuiz() -> String {
        var correct: CGFloat = 0
        for question in mockQuestions {
            if question.answer == question.selection {
                correct += 1
            }
            
        }
        return "\((correct/CGFloat(mockQuestions.count)) * 100 )%"
    }
}
