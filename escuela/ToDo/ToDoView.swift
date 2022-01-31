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

var taskStore: [String] = userDefaults.object(forKey: "tasksKey") as? [String] ?? []

struct ToDoView: View {
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
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    var body: some View {
        NavigationView() {
            VStack {
                addTaskBar
                List {
                    ForEach(taskStore, id: \.self) { (task) in
                        Text(task)
                    }
                    .onDelete(perform: self.deleteTask)
                }
                .navigationTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
            }
            .padding()
            .background(Color(red: 0.949, green: 0.949, blue: 0.971))
            .toolbar {
                EditButton()
            }
        }
    }
    
    func addNewTask() {
        if newTask != "" {
        let aNewTask = newTask
        taskStore.append(aNewTask)
        self.newTask = ""
        saveTasks()
        }
    }
    /* This method not working */
    func deleteTask(at offsets: IndexSet) {
        taskStore.remove(atOffsets:offsets)
        /*if let data = userDefaults.data(forKey: "tasksKey") {
            do {
                var arr = try JSONDecoder().decode([String].self, from: data)
                arr.remove(at: indexSet)
                let data = try JSONEncoder().encode(arr)
                userDefaults.set(data, forKey: "tasksKey")
            } catch {
                print(error)
            }
        }*/
        saveTasks()
    }
    
    func saveTasks() {
        userDefaults.set(taskStore, forKey: "tasksKey")
    }
    
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
