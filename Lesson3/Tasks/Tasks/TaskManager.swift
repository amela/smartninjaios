//
//  TaskManager.swift
//  Tasks
//
//  Created by amela on 21/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation

class TaskManager: NSObject {
    
    static let sharedTM = TaskManager()
    
    var tasks = NSUserDefaults.standardUserDefaults().objectForKey("tasks") as? [Task] ?? [Task]()
    
    func addTask(task: Task) {
        self.tasks.append(task)
        let tasksData = NSKeyedArchiver.archivedDataWithRootObject(tasks)
        NSUserDefaults.standardUserDefaults().setObject(tasksData, forKey: "tasks")
        
        
    }
    
    func removeTask(task: Task) {
        if let index = self.tasks.findFirstMatching( { $0.name == task.name && $0.dateAdd == task.dateAdd} ) {
            self.tasks.removeAtIndex(index)
            
            NSUserDefaults.standardUserDefaults().setObject(tasks, forKey: "tasks")
            
        } else {
            print("no task like this")
        }
    }
}

extension Array {
    func findFirstMatching<L : BooleanType>(predicate: Element -> L) -> Int? {
        var i = 0
        for item in self {
            if predicate(item) {
                return i
            }
            i += 1
        }
        return nil
    }
}


