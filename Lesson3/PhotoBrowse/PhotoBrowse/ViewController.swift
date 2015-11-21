//
//  ViewController.swift
//  PhotoBrowse
//
//  Created by amela on 17/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imgs = ["happy1", "happy2", "happy3", "happy4"]
    
    //@IBOutlet weak var textLabel: UILabel!
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionCell
        
        if let image = UIImage(named: imgs[indexPath.row]) as UIImage? {
            cell.cellImage.image = image
        }
        
        return(cell)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if let imagea = UIImage(named: imgs[indexPath.row]) as UIImage? {
            let w = CGFloat(imagea.size.width * 0.5)
            let h = CGFloat(imagea.size.height * 0.5)
            
            return(CGSize(width: w, height: h))
        }
        return(CGSize(width: 0, height: 0))
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return(imgs.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("izbrano")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //if segue.identifier == "Slika1" {
        let vc = segue.destinationViewController as! DetailViewController
        let cell = sender as! CollectionCell
        vc.slika = cell.cellImage.image
        //}
    }


}



