//
//  ContentView.swift
//  supabaseswiftuiquiz
//
//  Created by Chima onyekwere on 6/26/23.
//

import SwiftUI
class QuizMangager:ObservableObject{
    @Published var mockQuestions = [
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

struct ContentView: View {
    @StateObject var manager = QuizMangager()
    var body: some View {
        TabView {
            ForEach(manager.mockQuestions.indices, id: \.self){ index in
                VStack{
                    Spacer()
                    QuestionView(question: $manager.mockQuestions[index])
                    Spacer()
                    if let lastQuestion = manager.mockQuestions.last,lastQuestion.id == $manager.mockQuestions[index].id{
                        
                        Button{ print(manager.gradeQuiz())} label: {
                            Text("Submit")
                                .padding()
                                
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                                        .fill(Color("SelectColor"))
                                        .frame(width: 340)
                                )
                        }
                        .buttonStyle(.plain)
                        .disabled(!manager.canSubmitQuiz())
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
