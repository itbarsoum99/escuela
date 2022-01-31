//
//  ContentView.swift
//  notes
//
//  Created by Barsoum on 10/31/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .todo
    
    enum Tab {
        //case home
        case notes
        case todo
        //case assignments
        case about
        
        // add more for each page
    }
    var body: some View {
        TabView(selection: $selection) {
      
            ToDoView()
                .tabItem {
                    Label("Tasks", systemImage:  "checkmark.circle.fill")
                }
                .tag(Tab.todo)
            NotesView()
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
                .tag(Tab.notes)
            /*
            DueView()
                .tabItem {
                    Label("Assignments", systemImage: "sun.haze")
                    
                }
                .tag(Tab.assignments)
             */
            AboutView()
                .tabItem {
                    Label("About", systemImage: "questionmark.circle.fill")
                }
                .tag(Tab.about)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
