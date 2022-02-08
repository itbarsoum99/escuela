//
//  TimeStore.swift
//  escuela
//
//  Created by Barsoum on 2/7/22.
//

import Foundation

class Times: ObservableObject {
    @Published var times: [Int] = userDefaults.object(forKey: "timeKey") as? [Int] ?? []
}

