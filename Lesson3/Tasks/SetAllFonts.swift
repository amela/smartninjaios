//
//  SetFonts.swift
//  Tasks
//
//  Created by amela on 22/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation
import UIKit

let myFont = UIFont (name: "HelveticaNeue", size: 14)

func setAllLabelsCustomFont (view: UIView, font: UIFont = myFont!) {
    for subView in view.subviews {
        if subView.isKindOfClass(UILabel) {
            let label: UILabel = subView as! UILabel
            label.font = myFont
        }
    }
}