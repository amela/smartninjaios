// Lesson 2, dn2

/*
ime,
datum dodajanja,
datum spremembe,
prioriteta,
stanje.
*/

import Foundation

class Task {
    var dateChange: NSDate?
    let dateAdd: NSDate
    
    var name: String {
        didSet{ self.dateChange = NSDate() }
    }
    
    var state: State {
        didSet{ self.dateChange = NSDate() }
    }
    
    var priority: Int {
        didSet{ self.dateChange = NSDate() }
    }
    
    init(name:String, priority:Int = 5, state:State = State.ToDo) {
        self.name = name
        self.dateAdd = NSDate()
        self.state = state
        self.priority = priority
    }
    
}

//let task = Task(name:"Pojdi na Luno", priority:Priority.Low)
//if let name = task.dateChange { print(name) }
//else { print("No change.") }

//task.name = "Pojdi na Mars"
//if let name = task.dateChange { print(name) }
//else { print("No change.") }




