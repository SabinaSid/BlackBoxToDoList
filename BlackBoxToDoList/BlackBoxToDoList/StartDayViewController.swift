//
//  ViewController.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 29.09.2023.
//

import UIKit
//TODO: Add the dark skin
//TODO: Add a local store
class StartDayViewController: UIViewController {
    let greetLabel = UILabel()
    let startButton = UIButton()
    
    var taskList: TaskList!

    let greetingWords =
    """
    Hey!
    
    Today you'll start your day
    
    Your main task is to do something
    
    So...stay calm and be focus
    
    Are you ready?
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        view.backgroundColor = .white
        
        greetLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 230),
            startButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func startButtonTapped() {
        taskList.start()
        if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "TaskSB") as? TaskViewController {
            newViewController.taskList = taskList
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        typeTheGreeting()
    }
    
    
    func typeTheGreeting()  {
        greetLabel.text = String()
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(addNextCharacter(_:)), userInfo: nil, repeats: true)
    }
        
    @objc func addNextCharacter(_ sender: Timer) {
        guard let text = greetLabel.text else {
            sender.invalidate()
            return
        }
        
        if text.count == greetingWords.count {
            sender.invalidate()
            return
        }
        
        let index = text.endIndex
        let char = greetingWords[index]
        greetLabel.text?.append(char)
    }
}

