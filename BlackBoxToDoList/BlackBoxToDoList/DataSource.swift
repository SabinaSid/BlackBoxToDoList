//
//  DataSource.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 03.10.2023.
//

import UIKit
enum ErrorDataSource: Error {
    case taskListNotFound
}
class DataSource: NSObject {
    private var mondayList = TaskList(tasks: [
        Task(name: "Drink 2 cup of water: warm and mineral"),
        Task(name: "Morning stretch"),
        Task(name: "English lessons"),
        Task(name: "Devote time to iOS ~ 4 hours"),
        Task(name: "Meditation"),
        Task(name: "Plan the next day")],dayOfWeek: .monday)
    private var tuesdayList = TaskList(tasks: [
        Task(name: "Drink 2 cup of water: warm and mineral"),
        Task(name: "Morning stretch"),
        Task(name: "English lessons"),
        Task(name: "Devote time to iOS ~ 4 hours"),
        Task(name: "Meditation"),
        Task(name: "Plan the next day")], dayOfWeek: .tuesday)
    private var wednesdayList = TaskList(tasks: [
        Task(name: "Drink 2 cup of water: warm and mineral"),
        Task(name: "Morning stretch"),
        Task(name: "English lessons"),
        Task(name: "Devote time to iOS ~ 2 hours"),
        Task(name: "Devote time to course ~ 2 hours"),
        Task(name: "Meditation"),
        Task(name: "Plan the next day")], dayOfWeek: .wednesday)
    private var thursdayList = TaskList(tasks: [
        Task(name: "Drink 2 cup of water: warm and mineral"),
        Task(name: "Morning stretch"),
        Task(name: "English lessons"),
        Task(name: "Devote time to iOS ~ 1.5 hours"),
        Task(name: "Devote time to course ~ 1.5 hours"),
        Task(name: "Meditation"),
        Task(name: "Plan the next day")], dayOfWeek: .thursday)
    private var fridayList = TaskList(tasks: [
        Task(name: "Drink 2 cup of water: warm and mineral"),
        Task(name: "Morning stretch"),
        Task(name: "English lessons"),
        Task(name: "Cook something"),
        Task(name: "Make a new post in the channel"),
        Task(name: "Read the book"),
        Task(name: "Devote time to iOS ~ 1.5 hours"),
        Task(name: "Meditation"),
        Task(name: "Plan the next day")], dayOfWeek: .friday)
    private var saturdayList = TaskList(tasks: [
        Task(name: "Drink 2 cup of water: warm and mineral"),
        Task(name: "Morning stretch"),
        Task(name: "English lessons"),
        Task(),
        Task(name: "Meditation"),
        Task(name: "Plan the next day")], dayOfWeek: .saturday)
    private var sundayList = TaskList(tasks: [
        Task(name: "Drink 2 cup of water: warm and mineral"),
        Task(name: "Morning stretch"),
        Task(name: "English lessons"),
        Task(),
        Task(name: "Meditation"),
        Task(name: "Plan the next day")], dayOfWeek: .sunday)
    
    var arrayOfTaskLists: [TaskList]
    
    init(arrayOfTaskLists: [TaskList] = []) {
        self.arrayOfTaskLists = arrayOfTaskLists
        
        if arrayOfTaskLists.isEmpty {
            self.arrayOfTaskLists = [mondayList, tuesdayList, wednesdayList, thursdayList, fridayList, saturdayList, sundayList]
        }
    }
}
