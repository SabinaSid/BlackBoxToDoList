//
//  Task.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 29.09.2023.
//

import UIKit

enum Status: Int, Codable {
    case waiting = 1
    case processing = 2
    case done = 3
}

class Task: NSObject, Codable {
    var name: String
    var status: Status
    var date: Date
    
    init(name: String = "Do something", status: Status = .waiting, date: Date = Date()) {
        self.name = name
        self.status = status
        self.date = date
    }
    
    func nextStatus() {
        switch status {
        case .waiting: status = .processing
        case .processing: status = .done
        case .done: break
        }
        
    }
}
