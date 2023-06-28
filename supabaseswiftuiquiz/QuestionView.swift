//
//  QuestionView.swift
//  supabaseswiftuiquiz
//
//  Created by Chima onyekwere on 6/26/23.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let title: String
    let answer: String
    let choices: [String]
    var selection: String?
}

struct QuestionView: View {
    @State var question: Question
    var body: some View {
        VStack(alignment: .leading,spacing: 20){
            Text(question.title)
                .padding(.bottom)
            ForEach(question.choices, id:\.self){
                choice in
                HStack{
                    Button {
                        question.selection = choice
                        print(choice)
                    } label: {
                        if question.selection == choice {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24,height: 24)
                                .foregroundColor(Color("SelectColor"))
                        } else {
                            Circle()
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24,height: 24)
                        }
                    }
                    
                    Text(choice)
                }
            }
            
        }
        .foregroundColor(Color(uiColor: .secondaryLabel))
        .padding(.horizontal,20)
        .frame(width:320, height:500,alignment: .leading)
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(20)
        .shadow(color: Color(uiColor: .label).opacity(0.2), radius: 15)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Question(title: " When was the iPhone first released?", answer: "A", choices: ["A","B","C","D"]))
    }
}
