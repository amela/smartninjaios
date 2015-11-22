//
//  TaskInfo.swift
//  Tasks
//
//  Created by amela on 22/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class TaskInfo: UIViewController {
    
    var myAttributedText = NSMutableAttributedString()
    
    var name = "Zamenjaj Laminate"
    var priority = "8"
    var taskDescription = "Opis"
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        let atributiBold = [NSFontAttributeName : UIFont.boldSystemFontOfSize(14.0)]
        let atributiThin = [NSFontAttributeName : UIFont.systemFontOfSize(14.0)]
        
        myAttributedText.appendAttributedString(NSMutableAttributedString(string:"Name: ", attributes:atributiThin))
        myAttributedText.appendAttributedString(NSMutableAttributedString(string: name + "\n", attributes:atributiBold))
        
        myAttributedText.appendAttributedString(NSMutableAttributedString(string: "Priority: " , attributes:atributiThin))
        myAttributedText.appendAttributedString(NSMutableAttributedString(string: priority + "\n", attributes:atributiBold))
        
        myAttributedText.appendAttributedString(NSMutableAttributedString(string: "Description: " , attributes:atributiThin))
        myAttributedText.appendAttributedString(NSMutableAttributedString(string: taskDescription + "\n", attributes:atributiBold))
        
        infoLabel.attributedText = myAttributedText
    }
    
}