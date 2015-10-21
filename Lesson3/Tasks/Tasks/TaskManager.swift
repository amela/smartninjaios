//
//  TaskManager.swift
//  Tasks
//
//  Created by amela on 21/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

class TaskManager {
    var tasks: [Task] = []

    func addTask(task: Task) {
        self.tasks.append(task)
    }
    
    func removeTask(task: Task) {
        if let index = self.tasks.findFirstMatching( { $0.name == task.name && $0.dateAdd == task.dateAdd} ) {
            self.tasks.removeAtIndex(index)
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


