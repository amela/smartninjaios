//
//  MojDelegate.swift
//  Tasks
//
//  Created by amela on 29/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation

@objc protocol CarDriverDelegate : NSObjectProtocol {
    func turnOnEngine ()
    
    func driveCar ()
    
    optional func turnOffEngine (engineType : UInt)
}

class CarManager {
    
    var delegateDriver : CarDriverDelegate?
    
    var speed : Double {
        return 100.0
    }
    
    func runCar () {
        if let delegateDriver = delegateDriver {
            delegateDriver.turnOnEngine()
            for var i = 0; i < 10; i++ {
                delegateDriver.driveCar()
            }
            
            if delegateDriver.respondsToSelector("turnOffEngine") {
                //delegateDriver.performSelector("turnOffEngine:") dvopicje je ce ima parameter
                //delegateDriver.performSelector("turnOffEngine:currentTime:", withObject 0)
                delegateDriver.turnOffEngine!(3)
            }
            //delegateDriver.turnOffEngine?()
        }
    }
}

class Person : NSObject, CarDriverDelegate {
    func turnOnEngine() {
        print("TURN ON ENGINE")
    }
    func turnOffEngine() {
        print("TURN OFF ENGINE")
    }
    func driveCar() {
        print("DRIVE")
    }
}

func driverDelegateExample () {
    let carManager = CarManager()
    
    let person = Person()
    
    carManager.delegateDriver = person
    
    carManager.runCar()
}