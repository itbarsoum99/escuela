//
//  DueStore.swift
//  escuela
//
//  Created by Barsoum on 1/17/22.
//

import Foundation
import SwiftUI
import Combine

struct Due: Identifiable, Codable {
    var id = String()
    var dueItem = String()
    var dueDate = Date()
}

class AssignmentsDataStore: ObservableObject {
    //@Published var assignments = [Due]()
    @Published var assignments: [Due] = userDefaults.object(forKey: "dueKey") as? [Due] ?? []

    
    //@Published var assignments: [Due]

    
}
