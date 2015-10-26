//
//  ViewController.swift
//  Tasks
//
//  Created by amela on 21/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var priority: UITextField!
    @IBOutlet weak var notification: UILabel!
    
    @IBOutlet weak var lastTask: UILabel!
    
    @IBAction func addTask(sender: UIButton) {
        let nameVar = name.text
        let priorityVar = priority.text
        
        if let x = nameVar{
            let task = Task(name:x)
            if let prio = Int(priorityVar!) {
                task.priority = prio
                TaskManager.sharedTM.addTask(task)
            }
        }
        notification.text = String(TaskManager.sharedTM.tasks.count)
        
        
        //let formatter = NSDateFormatter()
        //formatter.dateStyle = NSDateFormatterStyle.LongStyle
        //formatter.timeStyle = .MediumStyle
        
        //let dateString = formatter.stringFromDate((TaskManager.sharedTM.tasks.last?.dateAdd)!)
        lastTask.text = (TaskManager.sharedTM.tasks.last?.name)! 
        
        //NSUserDefaults.standardUserDefaults().setObject(name, forKey: "GameName")
        //NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        priority.delegate = self
        
        //if let gameName = NSUserDefaults.standardUserDefaults().objectForKey("GameName") as? String {
        //    name.text = gameName
        //}
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("ENDED EDITING")
        
        if (textField == self.name){
            print("dsads")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

