//
//  TaskList.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 29.09.2023.
//

import UIKit
enum DayOfWeek:Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
}
class TaskList: NSObject {
    var tasks = [Task]()
    var dayOfWeek: DayOfWeek
   
    var currentTask: Task? {
        if let task = tasks.first(where: { $0.status == .processing} ) {
            return task
        }
        return nil
    }
    
    init(tasks: [Task] = [Task](), dayOfWeek: DayOfWeek) {
        self.tasks = tasks
        self.dayOfWeek = dayOfWeek
        
        //fist task is getting "processing" status
        self.tasks.first?.nextStatus()
    }
    
    func nextTask()  {
        guard let currentTask = currentTask else {
            return
        }
        
        //current task is getting "done" status
        currentTask.nextStatus()
        
        guard let nextTask = tasks.first(where: {$0.status == .waiting}) else {
            return
        }
       
        //next task is getting "processing" status
        nextTask.nextStatus()
    }
}
