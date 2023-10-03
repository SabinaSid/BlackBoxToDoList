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
            if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "EverythingIsDoneSB") as? EverythingIsDoneViewController {
                self.present(newViewController, animated: true)
                
            }
            return
        }
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipeRecognizer.direction = .left
        view.addGestureRecognizer(leftSwipeRecognizer)
        
        let rightSwipeRecognizer =  UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipeRecognizer.direction = .right
        view.addGestureRecognizer(rightSwipeRecognizer)
       
        taskNameLabel.text = currentTask.name
        taskNameLabel.textAlignment = .center
        taskNameLabel.shadowOffset = CGSize(width: 0, height: -1)
        taskNameLabel.alpha = 1
        taskNameLabel.numberOfLines = .max
        taskNameLabel.font = UIFont(name: "STIX Two Text", size: 25)
        taskNameLabel.textColor = .white
        taskNameLabel.frame = CGRect()
        view.addSubview(taskNameLabel)
        
        view.backgroundColor = .black
        
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            taskNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            taskNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
            if gesture.state == .ended {
                
                taskList.nextTask()
                
                UIView.animate(withDuration: 1, animations: {
                    self.view.backgroundColor = .white
                    self.taskNameLabel.textColor = .black
                    
                    let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self.taskNameLabel.text ?? "This task")
                        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                    
                    self.taskNameLabel.attributedText = attributeString
                    
                }) {_ in
                    self.taskNameLabel.attributedText = nil
                    self.viewDidLoad()
                }
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
