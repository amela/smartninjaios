//
//  TableTasksViewController.swift
//  Tasks
//
//  Created by amela on 02/12/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class TableTasksViewController: UITableViewController {
    
    // MARK: - Def. Sections
    
    var sectionsx = ["ToDo", "Done"]
    
    var mySections: [[Task]] {
        var todoSection = [Task]()
        var doneSection = [Task]()
        
        for tsk in TaskManager.sharedTM.tasks {
            if tsk.state == .ToDo {
                todoSection.append(tsk)
                
            } else {
                doneSection.append(tsk)
            }
        }
        
        var allSections = [[Task]]()
        allSections.append(todoSection.reverse())
        allSections.append(doneSection.reverse())
        
        return(allSections)
    }
    
    //MARK: - Table delegate functions
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionsx.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsx[section]
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        if indexPath.row < mySections[indexPath.section].count {
            if mySections[indexPath.section][indexPath.row].state == .ToDo {
                let done = UITableViewRowAction(style: .Normal, title: "Done") { action, index in
                    self.mySections[indexPath.section][indexPath.row].state = .Done
                    TaskManager.sharedTM.tasks[indexPath.row].state = .Done
                    print("Task done.")
                    tableView.reloadData()
                }
            
                done.backgroundColor = UIColor.orangeColor()
                let cell = tableView.dequeueReusableCellWithIdentifier("Celica", forIndexPath: indexPath) as! TableCells
                cell.userInteractionEnabled = true

                return [done]
                
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("Celica", forIndexPath: indexPath) as! TableCells
                cell.userInteractionEnabled = false
                return nil
            }
            
        } else {
            return nil
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row < mySections[indexPath.section].count {
            if mySections[indexPath.section][indexPath.row].state == .ToDo {
                return true
            
            } else {
                return false
            }
            
        } else {
            return false
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsAtSection: [Int] = [mySections[0].count, mySections[1].count]
        var rows = 0
        
        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }
        
        return rows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row < mySections[indexPath.section].count {
            let cell = tableView.dequeueReusableCellWithIdentifier("Celica", forIndexPath: indexPath) as! TableCells
            
            cell.nameLabel?.text = mySections[indexPath.section][indexPath.row].name
        
            print(String(mySections[indexPath.section][indexPath.row].name) + String(mySections[indexPath.section][indexPath.row].state))
            
            if mySections[indexPath.section][indexPath.row].state == .Done {
                cell.backgroundColor = UIColor.lightGrayColor()
                cell.accessoryType = .Checkmark
                cell.nameLabel.enabled = false
            
            } else {
                cell.backgroundColor = UIColor.whiteColor()
                cell.accessoryType = .DisclosureIndicator
                cell.nameLabel.enabled = true
            }
            
            return cell
        }
        
        else {
            return UITableViewCell()
        }
    }
    
    override func viewDidLoad () {
        super.viewDidLoad ()
        //self.tableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reload", name: "AddedTask", object: nil)
    }
    
    func reload () {
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

// MARK: - Cell Class

class TableCells : UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
}