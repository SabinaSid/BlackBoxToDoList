//
//  Task.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 29.09.2023.
//

import UIKit

enum Status {
    case waiting
    case open
    case processing
    case done
}

class Task: NSObject {
    var name: String
    var status: Status
    
    init(name: String = "Do something", status: Status = .waiting) {
        self.name = name
        self.status = status
    }
}