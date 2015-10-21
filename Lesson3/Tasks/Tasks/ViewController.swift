//
//  ViewController.swift
//  Tasks
//
//  Created by amela on 21/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let taskManager = TaskManager()
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var priority: UITextField!
    @IBOutlet weak var notification: UILabel!
    
    @IBAction func addTask(sender: UIButton) {
        let nameVar = name.text
        let priorityVar = priority.text
        
        if let x = nameVar{
            let task = Task(name:x)
            if let prio = Int(priorityVar!) {
                task.priority = prio
                taskManager.addTask(task)
            }
        }
        notification.text = String(taskManager.tasks.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

