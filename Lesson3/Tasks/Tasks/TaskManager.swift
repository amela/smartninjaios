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
        
        //let tasksData = NSKeyedArchiver.archivedDataWithRootObject(tasks)
        
        self.saveAllTasks()
        
        //NSUserDefaults.standardUserDefaults().setObject(tasksData, forKey: "tasks")
        //NSUserDefaults.standardUserDefaults().synchronize()
        
        NSNotificationCenter.defaultCenter().postNotificationName("AddedTask", object: nil)
    }
    
    func removeTask(task: Task) {
        print ("removam task")
        if let index = self.tasks.findFirstMatching( { $0.name == task.name && $0.dateAdd == task.dateAdd} ) {
            self.tasks.removeAtIndex(index)
            
            //let tasksData = NSKeyedArchiver.archivedDataWithRootObject(self.tasks)
            //NSUserDefaults.standardUserDefaults().setObject(tasksData, forKey: "tasks")
            //NSUserDefaults.standardUserDefaults().synchronize()
            
            saveAllTasks()
            
        } else {
            print("no task like this")
        }
    }
    
    func saveAllTasks () {
        var serializedTasks = [AnyObject]()
        
        for task in self.tasks {
            serializedTasks.append(task.toDictionary())
        }
        
        let JSON = ["AllTasks" : serializedTasks]
        
        do {
            let JSONString = try NSString(data: NSJSONSerialization.dataWithJSONObject(JSON, options: NSJSONWritingOptions(rawValue: 0)), encoding: NSUTF8StringEncoding)
            
            NSUserDefaults.standardUserDefaults().setObject(JSONString, forKey: "AllTasks")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        } catch {
            
        }
    
    }
    /* old Load
    func load (data: NSData) -> [Task] {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Task] {
            return(array)
            
        } else {
            return [Task]()
        }
    }
    */
    
    func load () -> [Task] {
        let serializedGames = NSUserDefaults.standardUserDefaults().objectForKey("AllTasks")
        
        var games = [Task]()
        
        if let serializedGames = serializedGames as? String {
            do {
                let JSON = try NSJSONSerialization.JSONObjectWithData(serializedGames.dataUsingEncoding(NSUTF8StringEncoding)!, options: NSJSONReadingOptions(rawValue: 0))
                
                if let JSON = JSON as? [String : [[String : AnyObject]]] {
                    for game in JSON["AllTasks"]! {
                        
                        let newGame = Task(dictionary: game)
                        print("tukisem")
                        games.append(newGame)
                    }
                }
            }
            catch {
                
            }
        }
        
        return games
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


