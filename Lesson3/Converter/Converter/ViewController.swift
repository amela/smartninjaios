//
//  ViewController.swift
//  Converter
//
//  Created by amela on 19/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate {
    
    let eurInstance = Currency(currency:"EUR")
    let usdInstance = Currency(currency:"USD")
    let jpyInstance = Currency(currency:"JPY")
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func convertButtons(sender: AnyObject) {
        
        if (sender as? UIButton != nil) {
            
            if let text = sender.currentTitle {
                if let num = Double(textField.text!) {
                    switch(text!) {
                    case "USD":
                        if let usd = ConverterBrain.sharedConverter.convert(num, startCurrency:"EUR", targetCurrency:usdInstance) {
                            resultLabel.text = String(format: " = %.2f $", usd.0)
                        }
                    
                    case "JPY":
                        if let jpy = ConverterBrain.sharedConverter.convert(num, startCurrency:"EUR", targetCurrency:jpyInstance) {
                            resultLabel.text = String(format: " = %.2f ¥", jpy.0)
                        }
                        
                    case "EUR":
                        if let eur = ConverterBrain.sharedConverter.convert(num, startCurrency:"EUR", targetCurrency:eurInstance) {
                            resultLabel.text = String(format: " = %.2f €", eur.0)
                        }
                        
                    default:
                        resultLabel.text = "Fail"
                    }
                }
                else {
                    let alertView = UIAlertController(title: "Invalid number", message: "Please enter a number.", preferredStyle: .Alert)
                    alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                    presentViewController(alertView, animated: true, completion: nil)
                }
            }
        }
    }
    

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
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

