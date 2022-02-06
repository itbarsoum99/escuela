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
    @State var flag = false
    
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
        taskStore = UserDefaults.standard.object(forKey: "tasksKey") as? [String] ?? []
    }
    var body: some View {
        NavigationView() {
            VStack {
                addTaskBar
                
                List {
                    ForEach(taskStore.indices, id: \.self) { (index) in
                        Text(taskStore[index])
                        
                    }
                    .onDelete(perform: deleteTask)
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
    func deleteTask(indexSet: IndexSet) {
        taskStore.remove(atOffsets:indexSet)
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
        userDefaults.synchronize()
    }
    
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
