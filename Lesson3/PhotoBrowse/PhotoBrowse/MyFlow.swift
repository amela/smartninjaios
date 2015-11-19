//
//  MyFlow.swift
//  PhotoBrowse
//
//  Created by amela on 17/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation
import UIKit

class MyFlow : UICollectionViewFlowLayout {
    var itemWidth: CGFloat = 30
    var itemHeight: CGFloat = 30
    let itemSpacing: CGFloat = 3
    //var layoutInfo: [NSIndexPath:UICollectionViewLayoutAttributes] = [NSIndexPath:UICollectionViewLayoutAttributes]()
    var maxXPos: CGFloat = 200
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        // setting up some inherited values
        self.itemSize = CGSizeMake(itemWidth, itemHeight)
        self.minimumInteritemSpacing = itemSpacing
        self.minimumLineSpacing = itemSpacing
        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
    }
}