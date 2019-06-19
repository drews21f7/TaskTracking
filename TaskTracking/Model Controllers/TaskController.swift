//
//  TaskController.swift
//  TaskTracking
//
//  Created by Drew Seeholzer on 6/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    static var sharedInstance = TaskController()
    
    init() {
        tasks = fetchTasks()
    }
    
    var tasks: [Task] = [] //{
//        let request: NSFetchRequest<Task> = Task.fetchRequest()
//        
//        return (try? CoreDataStack.managedObjectContext.fetch(request)) ?? []
//    }
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    func delete(task: Task) {
        if let moc = task.managedObjectContext {
            moc.delete(task)
            saveToPersistentStore()
            
        }
        
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving to moc: \(error.localizedDescription)")
        }
        
    }
    
    func fetchTasks() -> [Task] {
        return mockTasks
    }
    

    
    var mockTasks: [Task] {
        let currentDate = Date()
        let tasks = [
        Task(name: "Jump"),
        Task(name: "Shop"),
        Task(name: "Run", notes: "Run around or whatever", due: currentDate),
        Task(name: "Make complete task", notes: "Include isCOmplete", due: currentDate, isComplete: true)]
        return tasks
    }
}
