//
//  DataStore.swift
//  escuela
//
//  Created by Barsoum on 1/14/22.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var taskItem = String()
}

class TaskDataStore: ObservableObject {
    @Published var tasks = [Task]()
}


