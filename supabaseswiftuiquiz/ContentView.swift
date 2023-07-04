//
//  ContentView.swift
//  supabaseswiftuiquiz
//
//  Created by Chima onyekwere on 6/26/23.
//

import SwiftUI
class QuizMangager:ObservableObject{
    var mockQuestions = [
        Question(title: " When was the iPhone first released?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: " When was the iP?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: "  iPhone first released?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: " last?", answer: "A", choices: ["A","B","C","D"])
    ]
    func canSubmitQuiz() -> Bool{
//        for question in mockQuestions {
//            if question.id
//        }
        return mockQuestions.filter({$0.selection == nil }).isEmpty
        
    }
}

struct ContentView: View {
    @StateObject var manager = QuizMangager()
    var body: some View {
        TabView {
            ForEach(manager.mockQuestions, id: \.id){ question in
                VStack{
                    Spacer()
                    QuestionView(question: question)
                    Spacer()
                    if let lastQuestion = manager.mockQuestions.last,lastQuestion.id == question.id{
                        
                        Button{ print(manager.canSubmitQuiz())} label: {
                            Text("Submit")
                                .padding()
                                
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                                        .fill(Color("SelectColor"))
                                        .frame(width: 340)
                                )
                        }
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never) )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
