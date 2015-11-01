//
//  ViewController.swift
//  Converter
//
//  Created by amela on 19/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    let eurInstance = Currency(currency:"EUR", exchangeRate: 1.0)
    let usdInstance = Currency(currency:"USD", exchangeRate: 1.13585)
    let jpyInstance = Currency(currency:"JPY", exchangeRate: 136.044562)
    
    @IBOutlet weak var usdButton: UIButton!
    @IBOutlet weak var eurButton: UIButton!
    
    @IBOutlet weak var jpyButton: UIButton!
    
    @IBOutlet weak var countyLabel: UILabel!
    @IBOutlet weak var coordinateLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func selectButton(sender: AnyObject) {
        print((sender.titleLabel?!.text)!)
        if (sender.titleLabel?!.text)! == "USD" {
            convert("United States")
        }
        else if (sender.titleLabel?!.text)! == "JPY" {
            convert("Japan")
        }
        else {
            convert("Europe")
        }
    }
    
    
    
    @IBAction func convertButton(sender: UIButton) {
        if let num = Double(textField.text!) {
            if usdButton.selected == true {
                if let usd = ConverterBrain.sharedConverter.convert(num, targetCurrency:usdInstance) {
                        resultLabel.text = String(format: " = %.2f $", usd.0)
                }
            }
            
            else if eurButton.selected == true {
                if let jpy = ConverterBrain.sharedConverter.convert(num, targetCurrency:jpyInstance) {
                        resultLabel.text = String(format: " = %.2f ¥", jpy.0)
                }
            }
       
            else if jpyButton.selected == true {
                if let eur = ConverterBrain.sharedConverter.convert(num, targetCurrency:eurInstance) {
                    resultLabel.text = String(format: " = %.2f €", eur.0)
                }
            }
        
            else {
                resultLabel.text = "no input"
            }
        }
    }
    
    
    
    func convert (country : String) {
        if (country == "United States") {
            usdButton.selected = true
            eurButton.selected = false
            jpyButton.selected = false
        }
        else if (country == "Japan") {
            usdButton.selected = false
            eurButton.selected = false
            jpyButton.selected = true
        }
        else {
            usdButton.selected = false
            eurButton.selected = true
            jpyButton.selected = false
        }
    }
    
    var manager = CLLocationManager()
    var coordinateLocation = CLLocation()
    var placemark = CLPlacemark?()
    
    @IBAction func setLocation(sender: UIButton) {
        manager.startUpdatingLocation()
    }
    
    func receivedLocation(place : CLPlacemark) {
        
        self.placemark = place
        
        if let cntry = self.placemark?.country {
            countyLabel.text = cntry
            coordinateLabel.text = String(coordinateLocation.coordinate.latitude) + " " + String(coordinateLocation.coordinate.longitude)
            print(cntry)
            convert(cntry)
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        coordinateLocation = locations.first!
        
        CLGeocoder().reverseGeocodeLocation(coordinateLocation, completionHandler: {
            (placemarks, error) in
            manager.stopUpdatingLocation()
            print ("i am in")
            if ( error != nil ) { print(error) }
            if let pm = placemarks {
                if pm.count > 0 {
                    let place = pm[0]
                    //print(place.country)
                    self.receivedLocation(place)
                }
            }
        })
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.delegate = self
        //manager.startUpdatingLocation()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

