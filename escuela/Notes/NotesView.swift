//
//  NotesView.swift
//  escuela
//
//  Created by Barsoum on 1/3/22.
//

import SwiftUI

struct NotesView: View {
    @AppStorage("note1") private var note1 = ""
    
    @AppStorage("note2") private var note2 = ""
    @AppStorage("note3") private var note3 = ""
    @AppStorage("note4") private var note4 = ""
    @AppStorage("note5") private var note5 = ""
    @AppStorage("note6") private var note6 = ""
    

    
 
    init () {

        UITextView.appearance().backgroundColor = .init(Color(red: 0.808, green: 0.808, blue: 0.808)
)
        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        UIScrollView.appearance().keyboardDismissMode = .onDrag

    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            
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
