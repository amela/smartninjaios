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
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(dateChange, forKey: "dateChange")
        aCoder.encodeObject(dateAdd, forKey: "dateAdd")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(state.rawValue, forKey: "state")
        aCoder.encodeObject(priority, forKey: "priority")
    }
    
    required init(coder aDecoder: NSCoder) {
        self.dateChange = aDecoder.decodeObjectForKey( "dateChange" ) as? NSDate
        self.dateAdd = (aDecoder.decodeObjectForKey( "dateAdd" ) as? NSDate)!
        self.name = (aDecoder.decodeObjectForKey( "name" ) as? String)!
        self.state = State(rawValue: aDecoder.decodeIntegerForKey("state"))!
        self.priority   = aDecoder.decodeIntegerForKey( "priority" )
    }
}

extension Task: Equatable {}

func ==(lhs: Task, rhs: Task) -> Bool {
    return (lhs.name == rhs.name && lhs.dateChange == rhs.dateChange && lhs.dateAdd == rhs.dateAdd && rhs.state == lhs.state && rhs.priority == lhs.priority)
}


//let task = Task(name:"Pojdi na Luno", priority:Priority.Low)
//if let name = task.dateChange { print(name) }
//else { print("No change.") }

//task.name = "Pojdi na Mars"
//if let name = task.dateChange { print(name) }
//else { print("No change.") }




