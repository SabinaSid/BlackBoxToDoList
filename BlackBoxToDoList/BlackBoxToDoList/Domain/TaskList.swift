//
//  TaskList.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 29.09.2023.
//

import UIKit

class TaskList: NSObject {
    var tasks = [Task]()
    var dayOfWeek: String
    
    init(tasks: [Task] = [Task](), dayOfWeek: String) {
        self.tasks = tasks
        self.dayOfWeek = dayOfWeek
    }
}
