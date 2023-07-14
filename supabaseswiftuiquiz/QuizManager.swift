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
    
    
    @Published var questions = [Question]()
//
//    @Published var mockQuestions = [
//        Question(id:1, createdAt: "",title: " When was the iPhone first released?", answer: "A", choices: ["A","B","C","D"]),
//        Question(id:2, createdAt: "",title: " When was the iP?", answer: "A", choices: ["A","B","C","D"]),
//        Question(id:3, createdAt: "",title: "  iPhone first released?", answer: "A", choices: ["A","B","C","D"]),
//        Question(id:4, createdAt: "",title: " last?", answer: "A", choices: ["A","B","C","D"])
//    ]
//    
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://gbspfpgyitcipubditgo.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdic3BmcGd5aXRjaXB1YmRpdGdvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg1MDE3NDEsImV4cCI6MjAwNDA3Nzc0MX0.LOjNnNdYx55paXrbpBJ3CxIuRqhhtIIBzDarRWwek5A")
    
    init(){
        Task{
            do{
               let response = try await client.database.from("Quiz").select().execute()
                let data = response.underlyingResponse.data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let questions = try decoder.decode([Question].self, from: data)
                await MainActor.run {
                    self.questions = questions
                }
                print(questions)
               // print(String(data: data, encoding: .utf8))
            } catch{
                print("error fetching questions")
            }
            
        }
    }
    
    
    

    func canSubmitQuiz() -> Bool{

        return questions.filter({$0.selection == nil }).isEmpty
        
    }
    func gradeQuiz() -> String {
        var correct: CGFloat = 0
        for question in questions {
            if question.answer == question.selection {
                correct += 1
            }
            
        }
        return "\((correct/CGFloat(questions.count)) * 100 )%"
    }
}
