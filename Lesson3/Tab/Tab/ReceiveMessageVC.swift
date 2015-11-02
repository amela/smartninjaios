//
//  ViewController.swift
//  Tab
//
//  Created by amela on 02/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit


class ReceiveMessageVC: UIViewController, Message {

    
    @IBOutlet weak var receivedTextField: UITextView!
    
    var sporocilo : String?
    
    func theMessage (sporocilo : String) {
        self.sporocilo = sporocilo
        receivedTextField.text = self.sporocilo
        //print("sporocilo delegate dela")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print(self.sporocilo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = self.tabBarController?.viewControllers![0] as! SendMessageVC
        vc.delegate = self
        
        receivedTextField.text = self.sporocilo
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func loadView() {
        super.loadView()
        
        let vc = self.tabBarController?.viewControllers![0] as! SendMessageVC
        vc.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

