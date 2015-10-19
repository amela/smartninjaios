// Lesson 2, dn2

/*
ime,
datum dodajanja,
datum spremembe,
prioriteta,
stanje.
*/

import UIKit

enum Priority {
    case Low
    case Normal
    case High
}

class Task {
    var dateChange: NSDate?
    let dateAdd: NSDate
    
    var name: String? {
        didSet{ self.dateChange = NSDate() }
    }
    
    var state: Bool {
        didSet{ self.dateChange = NSDate() }
    }
    
    var priority: Priority {
        didSet{ self.dateChange = NSDate() }
    }
    
    init(name:String?, priority:Priority = Priority.Normal, state:Bool = true) {
        self.name = name
        self.dateAdd = NSDate()
        self.state = state
        self.priority = priority
    }
    
}

let task = Task(name:"Pojdi na Luno", priority:Priority.Low)
if let name = task.dateChange { print(name) }
else { print("No change.") }

task.name = "Pojdi na Mars"
if let name = task.dateChange { print(name) }
else { print("No change.") }




