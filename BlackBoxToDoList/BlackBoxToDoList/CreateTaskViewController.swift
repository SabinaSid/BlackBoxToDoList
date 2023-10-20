//
//  CreateTaskViewController.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 20.10.2023.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    let dataSource = DataSource(arrayOfTaskLists: [])
    var taskList: TaskList!
    
    let viewNameLabel = UILabel()
    let taskNameLabel = UILabel()
    let taskNameTextField = UITextField()
    let submitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewNameLabel.textAlignment = .center
        viewNameLabel.shadowOffset = CGSize(width: 0, height: -1)
        viewNameLabel.alpha = 1
        viewNameLabel.font = UIFont(name: "STIX Two Text", size: 25)
        viewNameLabel.text = "Create a new task"
        //viewNameLabel.textColor = .black
        view.addSubview(viewNameLabel)
        
        taskNameLabel.textAlignment = .center
        taskNameLabel.shadowOffset = CGSize(width: 0, height: -1)
        taskNameLabel.alpha = 1
        taskNameLabel.font = UIFont(name: "STIX Two Text", size: 20)
        taskNameLabel.text = "Enter task's name"
        //taskNameLabel.textColor = .black
        view.addSubview(taskNameLabel)
        
        taskNameTextField.placeholder = "Enter task's name"
        taskNameTextField.borderStyle = .roundedRect
        //taskNameLabel.textColor = .black
        view.addSubview(taskNameTextField)
        
        submitButton.setTitle("Add task", for: .normal)
        submitButton.titleLabel?.font = UIFont(name: "STIX Two Math", size: 22)
        submitButton.layer.cornerRadius = 10
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        //submitButton.backgroundColor = .black
        view.addSubview(submitButton)
        
        
        viewNameLabel.translatesAutoresizingMaskIntoConstraints = false
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        taskNameTextField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            taskNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            taskNameLabel.topAnchor.constraint(equalTo: viewNameLabel.bottomAnchor, constant: 100),
            
            taskNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            taskNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            taskNameTextField.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 8),
            
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            submitButton.heightAnchor.constraint(equalToConstant: 100),
            submitButton.widthAnchor.constraint(equalToConstant: 230)
            
        ])
        
       
        // Do any additional setup after loading the view.
    }
    @objc func submitButtonTapped() {
        let name = taskNameTextField.text ?? "Do smth"
        let date = Date()
    
        let task = Task(name: name, date: date)
        taskList.addTask(newTask: task)
        
        print(taskList.tasks.last?.name)
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
