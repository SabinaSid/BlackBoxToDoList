//
//  TaskViewController.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 29.09.2023.
//

import UIKit

class TaskViewController: UIViewController {
    
    var taskList: TaskList!
    var currentTask: Task?
    
    let taskNameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentTask = taskList.currentTask else {
            return print("That's all! You did all of your tasks!")
        }
        print( currentTask.name, currentTask.status)
       
        taskNameLabel.text = currentTask.name
        taskNameLabel.textAlignment = .center
        taskNameLabel.shadowOffset = CGSize(width: 0, height: -1)
        taskNameLabel.alpha = 1
        taskNameLabel.numberOfLines = 6
        taskNameLabel.font = UIFont(name: "STIX Two Text", size: 25)
        taskNameLabel.textColor = .white
        taskNameLabel.frame = CGRect()
        view.addSubview(taskNameLabel)
        
        view.backgroundColor = .black
        
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
