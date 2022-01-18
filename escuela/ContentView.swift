//
//  ContentView.swift
//  notes
//
//  Created by Barsoum on 10/31/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .notes
    
    enum Tab {
        case notes
        case todo
        case assignments
        // add more for each page
    }
    var body: some View {
        TabView(selection: $selection) {
            NotesView()
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
                .tag(Tab.notes)
            ToDoView()
                .tabItem {
                    Label("Tasks", systemImage:  "checkmark.circle.fill")
                }
                .tag(Tab.todo)
            DueView()
                .tabItem {
                    Label("Assignments", systemImage: "sun.haze")
                    
                }
                .tag(Tab.assignments)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
