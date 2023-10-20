//
//  TaskList.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 29.09.2023.
//

import UIKit
enum DayOfWeek:Int, Codable {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
}
class TaskList: NSObject, Codable {
    var tasks = [Task]()
    var dayOfWeek: DayOfWeek
    var isStarted: Bool = false
   
    var currentTask: Task? {
        if let task = tasks.first(where: { $0.status == .processing} ) {
            return task
        }
        return nil
    }
    
    init(tasks: [Task] = [Task](), dayOfWeek: DayOfWeek) {
        self.tasks = tasks
        self.dayOfWeek = dayOfWeek
        
        super.init()
        //fist task is getting "processing" status
        if self.tasks.first?.status == .waiting {
            self.tasks.first?.nextStatus()
        }
    }
    
    func start() {
        isStarted = true
        saveTaskList()
    }
    
    func nextTask()  {
        guard let currentTask = currentTask else {
            return
        }
        
        //current task is getting "done" status
        currentTask.nextStatus()
        
        saveTaskList()
        
        guard let nextTask = tasks.first(where: {$0.status == .waiting}) else {
            return
        }
       
        //next task is getting "processing" status
        nextTask.nextStatus()
        
        saveTaskList()
    }
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
        saveTaskList()
    }
        
    private func saveTaskList() {
        let encoder = JSONEncoder()
        
        if let encodedTaskList = try? encoder.encode(self) {
            UserDefaults.standard.set(encodedTaskList, forKey: "taskList")
        }
    }
}
