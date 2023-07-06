//
//  ContentView.swift
//  supabaseswiftuiquiz
//
//  Created by Chima onyekwere on 6/26/23.
//

import SwiftUI


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
