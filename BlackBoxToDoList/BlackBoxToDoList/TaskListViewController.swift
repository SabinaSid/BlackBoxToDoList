//
//  TaslListViewController.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 24.10.2023.
//

import UIKit

class TaskListViewController: UIViewController {
    let dataSource = DataSource(arrayOfTaskLists: [])
    var taskList: TaskList!
    
    let taskListTable = UITableView()
    let taskNameLabel = UILabel()
    let taskNameTextField = UITextField()
    let submitButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //view.addSubview(taskListTable)
        
        taskNameLabel.textAlignment = .center
        taskNameLabel.shadowOffset = CGSize(width: 0, height: -1)
        taskNameLabel.alpha = 1
        taskNameLabel.font = UIFont(name: "STIX Two Text", size: 20)
        taskNameLabel.numberOfLines = taskList.tasks.count
        taskNameLabel.text = taskNames()
    
        //taskNameLabel.textColor = .black
        view.addSubview(taskNameLabel)
        
    
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createTask))
        navigationItem.rightBarButtonItem = addButton
        
        print(navigationItem.rightBarButtonItem)
    
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            taskNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            taskNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
        // Do any additional setup after loading the view.
    }
    
    func taskNames() -> String  {
        var taskNamesString = ""
        for item in taskList.tasks {
            taskNamesString += "\(item.name): \(item.status) \n"
        }
        return taskNamesString
    }
    
    @objc func createTask() {
        if let newViewController =  self.storyboard?.instantiateViewController(withIdentifier: "CreateTaskSB") as? CreateTaskViewController {
            newViewController.taskList = taskList
            
            self.present(newViewController, animated: true)
            //self.navigationController?.pushViewController(newViewController, animated: true)
          }
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
