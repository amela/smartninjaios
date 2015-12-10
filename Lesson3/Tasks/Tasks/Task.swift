// Lesson 2, dn2

/*
ime,
datum dodajanja,
datum spremembe,
prioriteta,
stanje.
*/

import Foundation
import UIKit

class Task: NSObject {
    var dateChange: NSDate?
    let dateAdd: NSDate
    var img : UIImage?
    
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
        aCoder.encodeInteger(state.rawValue, forKey: "state")
        aCoder.encodeInteger(priority, forKey: "priority")
    }
    
    struct FormatDate {
        static var formatter : NSDateFormatter {
            let format = NSDateFormatter()
            format.dateStyle = .FullStyle
            
            return format
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        self.dateChange = aDecoder.decodeObjectForKey( "dateChange" ) as? NSDate
        self.dateAdd = aDecoder.decodeObjectForKey( "dateAdd" ) as! NSDate
        self.name = aDecoder.decodeObjectForKey( "name" ) as! String
        self.state = State(rawValue: aDecoder.decodeIntegerForKey("state"))!
        self.priority = aDecoder.decodeIntegerForKey( "priority" )
    }
    
    func toDictionary () -> [String : AnyObject] {
        var data : [String : AnyObject] = ["name" : self.name, "dateChange" : FormatDate.formatter.stringFromDate(self.dateChange!), "dateAdd" : FormatDate.formatter.stringFromDate(self.dateAdd), "priority" : self.priority, "state" : self.state.rawValue ]
    
        return data
    }
    
    init (dictionary: [String : AnyObject]) {
        self.name = dictionary["name"] as! String
        self.priority = dictionary["priority"] as! Int
        self.dateAdd = FormatDate.formatter.dateFromString(dictionary["dateAdd"] as! String)!
        self.dateChange = FormatDate.formatter.dateFromString(dictionary["dateChange"] as! String)!

        self.state = State(rawValue: (dictionary["state"] as! Int))!
        
        /*
        if let notes = dictionary["notes"] as? String {
            self.notes = notes
        }
        */
    }
}

//MARK: - Extension

func ==(lhs: Task, rhs: Task) -> Bool {
    return (lhs.name == rhs.name && lhs.dateChange == rhs.dateChange && rhs.state == lhs.state && rhs.priority == lhs.priority)
}

//let task = Task(name:"Pojdi na Luno", priority:Priority.Low)
//if let name = task.dateChange { print(name) }
//else { print("No change.") }

//task.name = "Pojdi na Mars"
//if let name = task.dateChange { print(name) }
//else { print("No change.") }




