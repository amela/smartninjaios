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
    
    /*
    lazy var tasks: [Task] = {
            let tasksArchived = NSUserDefaults.standardUserDefaults().objectForKey("tasks") as? NSData ?? NSData()
            return (TaskManager.sharedTM.load(tasksArchived))
    }()
    */
    
    var tasks: [Task] = [Task]()
    
    func addTask(task: Task) {
        self.tasks.append(task)
        
        let tasksData = NSKeyedArchiver.archivedDataWithRootObject(tasks)
        
        NSUserDefaults.standardUserDefaults().setObject(tasksData, forKey: "tasks")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        NSNotificationCenter.defaultCenter().postNotificationName("AddedTask", object: nil)
    }
    
    func removeTask(task: Task) {
        if let index = self.tasks.findFirstMatching( { $0.name == task.name && $0.dateAdd == task.dateAdd} ) {
            self.tasks.removeAtIndex(index)
            
            NSUserDefaults.standardUserDefaults().setObject(tasks, forKey: "tasks")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        } else {
            print("no task like this")
        }
    }
    
    func load (data: NSData) -> [Task] {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Task] {
            return(array)
        }
        else {
            return [Task]()
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

extension TaskManager {
    func equalStates (state: State) -> ([Task]) {
        var retTasks = [Task]()
        for tasks in TaskManager.sharedTM.tasks {
            if tasks.state == state {
                retTasks.append(tasks)
            }
        }
        return retTasks
    }
}


