//
//  ViewController.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 29.09.2023.
//

import UIKit
//TODO: Add navigation controller
//TODO: Make the greeting word animated
//TODO: Identify the day of week
//TODO: Load the list depending on the day of week
//TODO: Add the dark skin
//TODO: Add a local store
class ViewController: UIViewController {
    let greetLabel = UILabel()
    let startButton = UIButton()
    
    var taskList: TaskList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var monTaskList = TaskList(tasks: [Task(), Task(name: "English lessons"), Task(name: "Morning stretch")], dayOfWeek: .monday)
        monTaskList.nextTask()
        monTaskList.nextTask()
        
        var tueTaskList = TaskList(tasks: [Task(), Task(name: "2English lessons"), Task(name: "2Morning stretch")], dayOfWeek: .tuesday)
        //tueTaskList.nextTask()
        //tueTaskList.nextTask()
        
        var arrayTaskLists: [TaskList] = [monTaskList, tueTaskList]
        
        let date = Date()
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: date)
        print(dayOfWeek)
        
        for item in arrayTaskLists {
            if item.dayOfWeek.rawValue == dayOfWeek {
                taskList = item
            }
        }
        
        
        
        let greetingWords =
        """
        Hey!
        
        Today you'll start your day
        
        Your main task is to do something
        
        So...stay calm
        
        Are you ready?
        """
        
        greetLabel.text = greetingWords
        greetLabel.textAlignment = .center
        greetLabel.shadowOffset = CGSize(width: 0, height: -1)
        greetLabel.alpha = 1
        greetLabel.numberOfLines = 10
        greetLabel.font = UIFont(name: "STIX Two Text", size: 25)
        greetLabel.textColor = .black
        view.addSubview(greetLabel)
        
        startButton.setTitle("Start this DAY!", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "STIX Two Math", size: 22)
        startButton.backgroundColor = .black
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        
        greetLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 230),
            startButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    @objc func startButtonTapped() {
        if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "TaskSB") as? TaskViewController {
            newViewController.taskList = taskList
            self.present(newViewController, animated: true)
        }
    }


}

