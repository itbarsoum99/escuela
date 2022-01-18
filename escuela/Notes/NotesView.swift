//
//  NotesView.swift
//  escuela
//
//  Created by Barsoum on 1/3/22.
//

import SwiftUI

struct NotesView: View {
    @State public var note1 = ""
    @State private var note2 = ""
    @State private var note3 = ""
    @State private var note4 = ""
    @State private var note5 = ""
    @State private var note6 = ""
    
    
    init () {

        UITextView.appearance().backgroundColor = .init(Color(red: 0.808, green: 0.808, blue: 0.808)
)
        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
    }
    var body: some View {
        ScrollView {
            
            HStack {
                Text("Quick Notes")
                    .fontWeight(.bold)
                    .padding()
                    .font(.largeTitle)
                Spacer()
            }

            TextEditor(text: $note1)
                
                .frame(minHeight: 300)
                .cornerRadius(10.0)
                .padding([.leading, .bottom, .trailing])


            TextEditor(text: $note2)
                .frame(height: 300)
                .cornerRadius(10.0)
                .padding([.leading, .bottom, .trailing])


            TextEditor(text: $note3)
                .frame(height: 300)
                .cornerRadius(10.0)
                .padding([.leading, .bottom, .trailing])

            TextEditor(text: $note4)
                .frame(height: 300)
                .cornerRadius(10.0)
                .padding([.leading, .bottom, .trailing])

            TextEditor(text: $note5)
                .frame(height: 300)
                .cornerRadius(10.0)
                .padding([.leading, .bottom, .trailing])

            TextEditor(text: $note6)
                .frame(height: 300)
                .cornerRadius(10.0)
                .padding([.leading, .bottom, .trailing])
        }
        //.foregroundColor(.white)
        .background(Color(red: 0.949, green: 0.949, blue: 0.971))

    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
