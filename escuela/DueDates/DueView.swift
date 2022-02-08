//
//  DueView.swift
//  escuela
//
//  Created by Barsoum on 1/17/22.
//

import Foundation
import SwiftUI
import Combine



struct DueView: View {
    
    @State var newAssignment: String = ""
    
    @State var assignmentDue: Date = Date()
    
    @ObservedObject var dueStore = AssignmentsDataStore()
    

    @FocusState private var isInputActive: Bool
    
    
    
    var addAssignment: some View {

        HStack {
            TextField("Add assignment", text: self.$newAssignment)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isInputActive = false
                    }
                }
            }
            DatePicker(selection: self.$assignmentDue, displayedComponents: [.date]) {
                Text("")
            }
            .datePickerStyle(.compact)

            Button(action: self.addAnAssignment, label: {Image(systemName: "plus").imageScale(.large)})
        }
        
        
    }
    var body: some View {

        NavigationView {

            VStack {
                addAssignment
                
                List {
                    ForEach(dueStore.assignments) { duething in
                        VStack(alignment: .leading) {
                            Text(duething.dueItem)
                                .fontWeight(.bold)
                                .font(.title3)
                            
                            let hasPassed = duething.dueDate < Date()
                            let isToday = Calendar.current.isDateInToday(duething.dueDate)
                            let tomorrowsDate = Date().addingTimeInterval(86400)
                            let isTomorrow = Calendar.current.isDate(duething.dueDate, equalTo: tomorrowsDate, toGranularity: .day)
                            let twoDaysDate = Date().addingTimeInterval(172800)
                            let isInTwoDays = Calendar.current.isDate(duething.dueDate, equalTo: twoDaysDate, toGranularity: .day)

                            if (isToday == true || hasPassed == true) {
                                Text(duething.dueDate, style: .date)
                                    .foregroundColor(.red)
                            } else if (isTomorrow == true || isInTwoDays == true) {
                                Text(duething.dueDate, style: .date)
                                    .foregroundColor(Color(hue: 0.08, saturation: 1.0, brightness: 1.0))
                            } else {
                                Text(duething.dueDate, style: .date)
                            }
                            
                        }
                        
                    }.onDelete(perform: self.deleteAssignment)
                }
                .navigationTitle("Assignments")
                .navigationBarItems(trailing: EditButton())
                
            }
            .padding()
            
            .background(Color(red: 0.949, green: 0.949, blue: 0.971))

        }
        
    }
    func addAnAssignment() {
        if newAssignment != "" {
        let aNewAssignment = Due(
            id: String(dueStore.assignments.count + 1),
            dueItem: newAssignment,
            dueDate: assignmentDue
        )
        dueStore.assignments.append(aNewAssignment)
        saveAssignments()
       

        
        /*self.newAssignment = ""
        dueStore.assignments.sort {
            $0.dueDate < $1.dueDate
            }*/
        }
         
    }

    func deleteAssignment(at offsets: IndexSet) {
        dueStore.assignments.remove(atOffsets:offsets)
        saveAssignments()
    }

    func saveAssignments() {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(dueStore.assignments)

            // Write/Set Data
            userDefaults.set(data, forKey: "dueKey")

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    

}


struct DueView_Previews: PreviewProvider {
    static var previews: some View {
        DueView()
    }
}
