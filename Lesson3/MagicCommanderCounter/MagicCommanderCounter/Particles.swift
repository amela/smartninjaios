//
//  Particles.swift
//  MagicCommanderCounter
//
//  Created by amela on 09/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit
import CoreMotion

import ChameleonFramework
    
class ParticleView: UIView {
    
    //MARK: - Def. Variables
    
    var particles = [Particle]()
    let manager = CMMotionManager()
        
    var k1 : Double = 0.0
    var k2 : Double = 0.0
    
    //var slika = UIImage(named: "background2.png")
    
    
    //MARK: - Init and Load
    
    override init(frame: CGRect) {
            
        // Do any additional setup after loading the view, typically from a nib.
            
        super.init(frame:frame)
            
        self.setParticle()
        
        let colors:[UIColor] = [
            UIColor.flatSandColor(),
            //UIColor.flatWhiteColor(),
            UIColor.flatRedColor()
        ]
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        self.backgroundColor = UIColor(gradientStyle: UIGradientStyle.TopToBottom, withFrame: frame, andColors:colors)

        //self.backgroundColor = UIColor(patternImage: slika!)
        
        self.setTimer()
        //manager.startGyroUpdates()
        if manager.gyroAvailable {
            print("manager dela")
            manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data, error) -> Void in
                //print(data!.gravity.x)
                self.k1 = data!.gravity.x
                self.k2 = (-1) * (data!.gravity.y)
            })
        }
    }

        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Make particles
    
    func setParticle(){
        for _ in 0...200{
                
            let px = CGFloat(arc4random() % UInt32(self.frame.size.width))
            let py = CGFloat(arc4random() % UInt32(self.frame.size.height))
            let location = CGVector(dx: px,dy: py)
                
            let velocity = CGVector(dx: 0,dy: 0)
                
            let p = Particle(location:location,velocity:velocity)
                
            p.createView()
                
            self.addSubview(p.view)
                
            particles.append(p)
        }
    }
        
    
    //MARK: - Timer and Updating Timer
    
    func setTimer(){
        NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateFrame"), userInfo: nil, repeats: true)
    }
        
        
    func updateFrame(){
        for p in particles{
            
            p.location.dx = p.location.dx + p.velocity.dx
            p.location.dy = p.location.dy + p.velocity.dy
                
            p.view.frame = CGRect(x:p.location.dx+CGFloat(k1)*p.location.dx*(p.location.dx/CGFloat(self.frame.size.width)-1), y:p.location.dy+CGFloat(k2)*p.location.dy*(p.location.dy/CGFloat(self.frame.size.height)-1), width:2,height:2)
        }
    }
}

//MARK - Particle

class Particle{
    var location:CGVector
    var velocity:CGVector
    var view:UIView
        
    init(location:CGVector,velocity:CGVector){
        self.location = location
        self.velocity = velocity
        self.view = UIView()
    }
        
    func createView(){
        self.view.frame = CGRect(x:location.dx,y:location.dy,width:2,height:2)
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.layer.cornerRadius = 2
    }
        
}


