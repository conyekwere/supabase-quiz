//
//  ContentView.swift
//  supabaseswiftuiquiz
//
//  Created by Chima onyekwere on 6/26/23.
//

import SwiftUI
class QuizMangager:ObservableObject{
    var mockQustions = [
        Question(title: " When was the iPhone first released?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: " When was the iP?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: "  iPhone first released?", answer: "A", choices: ["A","B","C","D"]),
        Question(title: " iPhone first released?", answer: "A", choices: ["A","B","C","D"])
    ]
}

struct ContentView: View {
    @StateObject var manager = QuizMangager()
    var body: some View {
        TabView {
            ForEach(manager.mockQustions, id: \.id){ question in
                QuestionView(question: question)
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
