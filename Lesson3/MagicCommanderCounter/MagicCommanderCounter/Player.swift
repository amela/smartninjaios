//
//  Player.swift
//  MagicCommanderCounter
//
//  Created by amela on 06/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation
import UIKit

class Player : NSObject {
    var name : String
    var life : Int
    var color : UIColor?
    var note : String?
    
    init(name : String = "Player", life: Int = 20) {
        self.name = name
        self.life = life
    }
}

