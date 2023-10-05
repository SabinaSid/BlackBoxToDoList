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
        
        taskList = selectTaskList()
        
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
