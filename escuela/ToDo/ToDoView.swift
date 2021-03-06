//
//  ToDoView.swift
//  escuela
//
//  Created by Barsoum on 1/14/22.
//

import Foundation
import SwiftUI
import Combine

let userDefaults = UserDefaults.standard


struct ToDoView: View {
    @State var newTask = ""
    @ObservedObject public var taskStore = Tasks()
    @FocusState var isInputActive: Bool
    //@State var flag = false
    
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
        //taskStore = UserDefaults.standard.object(forKey: "tasksKey") as? [String] ?? []
    }
    var body: some View {
        NavigationView() {
            VStack {
                addTaskBar
                
                List {
                    ForEach(taskStore.ts.indices, id: \.self) { (index) in
                        Text(taskStore.ts[index])
                        
                    }
                    .onDelete(perform: deleteTask)
                    .onMove(perform: move)
                }
                .navigationTitle("Tasks")
                //.navigationBarItems(trailing: EditButton())
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
            taskStore.ts.append(aNewTask)
            self.newTask = ""
            saveTasks()
        }
    }
    func deleteTask(indexSet: IndexSet) {
        taskStore.ts.remove(atOffsets:indexSet)
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
        userDefaults.set(taskStore.ts, forKey: "tasksKey")
        userDefaults.synchronize()
    }
    func move(from source: IndexSet, to destination: Int) {
        taskStore.ts.move(fromOffsets: source, toOffset: destination)
        saveTasks()
    }
    
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
