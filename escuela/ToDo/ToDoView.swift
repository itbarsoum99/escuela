//
//  ToDoView.swift
//  escuela
//
//  Created by Barsoum on 1/14/22.
//

import SwiftUI
import Combine

struct ToDoView: View {
    @ObservedObject var taskStore = TaskDataStore()
    
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
        NavigationView {

            VStack {
                
                
                addTaskBar
                
                List {
                    ForEach(self.taskStore.tasks) { task in
                        Text(task.taskItem)
                        
                    }.onDelete(perform: self.deleteTask)
                }
                .navigationTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
                
            }
            .padding()
            
            .background(Color(red: 0.949, green: 0.949, blue: 0.971))

        }
        
    }
    func addNewTask() {
        if newTask != "" {
        taskStore.tasks.append(Task(
            id: String(taskStore.tasks.count + 1),
            taskItem: newTask
        ))
        
        self.newTask = ""
        }
    }

    func deleteTask(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets:offsets)
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
