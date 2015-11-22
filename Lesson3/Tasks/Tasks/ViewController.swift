//
//  ViewController.swift
//  Tasks
//
//  Created by amela on 21/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, SelectedImageDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var priority: UITextField!
    @IBOutlet weak var notification: UILabel!
    
    @IBOutlet weak var lastTask: UILabel!
    
    var img : UIImage?
    
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
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.timeStyle = .ShortStyle
        
        let dateString = formatter.stringFromDate((TaskManager.sharedTM.tasks.last?.dateAdd)!)
        lastTask.text = (TaskManager.sharedTM.tasks.last?.name)! + " add " + dateString
        
        NSNotificationCenter.defaultCenter().postNotificationName("Added Task", object: self)
    }
    
    func selectedImage(img : UIImage) {
        self.img = img
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notification.text = String(TaskManager.sharedTM.tasks.count)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "MySegue"{
            let vc = segue.destinationViewController as! ViewController2
            vc.delegate = self
            //print("sem v segue")
        }
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

