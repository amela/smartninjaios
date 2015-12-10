//
//  Protocol.swift
//  MagicCommanderCounter
//
//  Created by amela on 06/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation

protocol Refresh : NSObjectProtocol {
    func refresh () -> ()
}

protocol CellIndexProtocol: class {
    func test(life: CellView) -> NSIndexPath
}