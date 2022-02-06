//
//  DataStore.swift
//  escuela
//
//  Created by Barsoum on 1/21/22.
//

import Foundation
import SwiftUI
import Combine
/*
struct Task: Identifiable, Codable {
    var id = String()
    var taskItem = String()
}
*/
class NewTask: ObservableObject {
    @Published var taskName = ""
    
    
}

class Tasks: ObservableObject {
    @Published var ts: [String] = userDefaults.object(forKey: "tasksKey") as? [String] ?? []
}

