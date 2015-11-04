//
//  Item2ViewController.swift
//  Tab
//
//  Created by amela on 02/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class SendMessageVC: UIViewController {
    
    var sporocilo : String?
    var delegate : Message?
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var allMessage = [String]()
    
    @IBOutlet weak var sendTextField: UITextView!
    
    @IBAction func sendButton(sender: UIButton) {
        sporocilo = sendTextField.text
        allMessage.append(sporocilo!)
        
        defaults.setObject(allMessage, forKey: "SavedArray")
        delegate?.theMessage(allMessage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for vc in (self.tabBarController?.viewControllers!)! {
            vc.loadViewIfNeeded()
        }
        
        allMessage = defaults.objectForKey("SavedArray") as? [String] ?? [String]()
        delegate?.theMessage(allMessage)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
