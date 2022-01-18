//
//  DueView.swift
//  escuela
//
//  Created by Barsoum on 1/17/22.
//

import SwiftUI
import SwiftUI
import Combine

struct DueView: View {
    @ObservedObject var dueStore = AssignmentsDataStore()
    
    @State var newAssignment: String = ""
    
    @State var assignmentDue: Date = Date()
    
    var addAssignment: some View {
        HStack {
            TextField("Assignment", text: self.$newAssignment)
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
                    ForEach(self.dueStore.assignments) { duething in
                        VStack(alignment: .leading) {
                            Text(duething.dueItem)
                                .fontWeight(.bold)
                                .font(.title3)
                                
                            Text(duething.dueDate, style: .date)
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
        dueStore.assignments.append(Due(
            id: String(dueStore.assignments.count + 1),
            dueItem: newAssignment,
            dueDate: assignmentDue
        ))
        
        self.newAssignment = ""
        }
    }

    func deleteAssignment(at offsets: IndexSet) {
        dueStore.assignments.remove(atOffsets:offsets)
    }
}


struct DueView_Previews: PreviewProvider {
    static var previews: some View {
        DueView()
    }
}
