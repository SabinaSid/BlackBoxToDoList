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
   
    var currentTask: Task? {
        if let task = tasks.first(where: { $0.status == .processing} ) {
            return task
        }
        return nil
    }
    
    init(tasks: [Task] = [Task](), dayOfWeek: String) {
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
