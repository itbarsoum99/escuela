//
//  ToDoView.swift
//  escuela
//
//  Created by Barsoum on 1/14/22.
//

import Foundation
import SwiftUI
import Combine

/*struct Task: Identifiable, Codable {
    var id = String()
    var taskItem = String()
}*/
let userDefaults = UserDefaults.standard

var taskStore: [String] = userDefaults.object(forKey: "myKey") as? [String] ?? []

struct ToDoView: View {

    
    /*@AppStorage("taskList") private var taskStore = [Task]()*/
    
    @State var newTask: String = ""
    
    @FocusState var isInputActive: Bool
    
    var addTaskBar: some View {
        HStack {
            TextField("Add a task ", text: self.$newTask)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()

                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
            Button(action: self.addNewTask, label: {Image(systemName: "plus").imageScale(.large)})
        }
        
    }
    var body: some View {
        NavigationView() {

            VStack {
                
                
                addTaskBar
                
                List {
                    ForEach(taskStore, id: \.self) { task in
                        Text(task)

                        
                    }
                    .onDelete(perform: self.deleteTask)


                }
                
                .navigationTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
                
            }
            .padding()
            
            .background(Color(red: 0.949, green: 0.949, blue: 0.971))

        }
        
    }
    
    // somewhere below here
    func addNewTask() {
        if newTask != "" {
        let aNewTask = newTask
        taskStore.append(aNewTask)
        self.newTask = ""
            saveTasks()

        }
    }

    func deleteTask(at offsets: IndexSet) {
        taskStore.remove(atOffsets:offsets)
        //userDefaults.set(taskStore, forKey: "myKey")

    }
    
    func saveTasks() {
        userDefaults.set(taskStore, forKey: "myKey")
    }
    
    // above here
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
