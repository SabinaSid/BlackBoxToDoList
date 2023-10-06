//
//  NavigationController.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 05.10.2023.
//

import UIKit

class NavigationController: UINavigationController {
    
    let dataSource = DataSource(arrayOfTaskLists: [])
    var taskList: TaskList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        let currentDayOfWeek =  Calendar.current.component(.weekday, from: Date())
        
        /*
        UserDefaults.standard.setValue(false, forKey: "isStarted")
        UserDefaults.standard.setValue(currentDayOfWeek, forKey: "dayOfWeekRawValue")
        
        let encoder = JSONEncoder()
        if let encodedTasks = try? encoder.encode(selectTaskList().tasks) {
            UserDefaults.standard.set(encodedTasks, forKey: "tasks")
        }
        */
        
        let isStarted = userDefaults.bool(forKey: "isStarted")
        //isStarted = false

        if isStarted && userDefaults.integer(forKey: "dayOfWeekRawValue") == currentDayOfWeek {
            if let savedData = userDefaults.data(forKey: "tasks"),
               let decodedArray = try? JSONDecoder().decode([Task].self, from: savedData) {
                let dayOfWeek = DayOfWeek(rawValue: currentDayOfWeek)
                taskList = TaskList(tasks: decodedArray, dayOfWeek: dayOfWeek!)
                print(dayOfWeek)
                for item in decodedArray {
                    print(item.status)
                }
                
                taskList.isStarted = isStarted
                print("tasks", decodedArray)
            }
        } else {
            taskList = selectTaskList()
        }
        

        //taskList.start()
        /*
        taskList.nextTask()
        taskList.nextTask()
        taskList.nextTask()
        taskList.nextTask()
        taskList.nextTask()
        taskList.nextTask()
        taskList.nextTask()
         */
   
        switch taskList.isStarted {
           
        case false:
            if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartSB") as? ViewController {
                newViewController.taskList = taskList
                self.pushViewController(newViewController, animated: true)
            }
        case true && taskList.currentTask != nil:
            if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "TaskSB") as? TaskViewController {
                newViewController.taskList = taskList
                self.pushViewController(newViewController, animated: true)
            }
        default:
            if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "EverythingIsDoneSB") as? EverythingIsDoneViewController {
                self.pushViewController(newViewController, animated: true)
            }
        }
    }
    
    func selectTaskList() -> TaskList {
        let arrayTaskLists: [TaskList] = dataSource.arrayOfTaskLists
        
        let date = Date()
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: date)
        
        guard let currentList = arrayTaskLists.first(where: { $0.dayOfWeek.rawValue == dayOfWeek}) else {
            return TaskList(dayOfWeek: DayOfWeek(rawValue: dayOfWeek) ?? .monday)
        }
        
        return currentList
    }
}
