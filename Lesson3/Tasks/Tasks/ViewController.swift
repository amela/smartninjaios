//
//  ViewController.swift
//  Tasks
//
//  Created by amela on 21/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, SelectedImageDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var notification: UILabel!
    
    @IBOutlet weak var lastTask: UILabel!
    
    @IBOutlet weak var priority: UISlider!
    var img : UIImage?
    
    @IBOutlet weak var taskDescription: UITextView!
    
    // MARK: - Actions
    
    @IBAction func addTask(sender: UIButton) {
        let nameVar = name.text
        let priorityVar = priority.value
        
        if let x = nameVar{
            let task = Task(name:x, state:.ToDo)
                task.priority = Int(priorityVar)
                TaskManager.sharedTM.addTask(task)
        }
        
        notification.text = String(TaskManager.sharedTM.tasks.count)
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.timeStyle = .ShortStyle
        
        let dateString = formatter.stringFromDate((TaskManager.sharedTM.tasks.last?.dateAdd)!)
        lastTask.text = (TaskManager.sharedTM.tasks.last?.name)! + " add " + dateString
        
        NSNotificationCenter.defaultCenter().postNotificationName("Added Task", object: self)
        
        print(name.text)
        
        if name.text! == "" {
            //print ("notri")
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(CGPoint: CGPointMake(name.center.x - 10, name.center.y))
            animation.toValue = NSValue(CGPoint: CGPointMake(name.center.x + 10, name.center.y))
            name.layer.addAnimation(animation, forKey: "position")
        }
        
        UIView.animateWithDuration(0.2 ,
            animations: {
                sender.transform = CGAffineTransformMakeScale(1.1, 1.1)
            },
            completion: { finish in
                UIView.animateWithDuration(0.2){
                    sender.transform = CGAffineTransformIdentity
                }
        })
            
    }
    
    // MARK: - Image Setter
    
    func selectedImage(img : UIImage) {
        self.img = img
    }
    
    // MARK: - Delegate Functions
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("ENDED EDITING")
        if (textField == self.name){
            print("dsads")
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return true
        }
        return true
    }
    
    
    // MARK: - Other
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAllLabelsCustomFont(self.view)
        
        notification.text = String(TaskManager.sharedTM.tasks.count)
        
        name.delegate = self
        taskDescription.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "MySegue"{
            let vc = segue.destinationViewController as! ViewController2
            vc.delegate = self
            //print("sem v segue")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

