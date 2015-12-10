//
//  CollectionVC.swift
//  MagicCommanderCounter
//
//  Created by amela on 04/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import QuartzCore
import UIKit

import ChameleonFramework



class CollectionControler: UICollectionViewController,  UICollectionViewDelegateFlowLayout, Refresh, CellIndexProtocol {
    
    // - MARK: Def. Variable
    
    let singel = PlayerManager.sharedPM
    let identifier = "CellIdentifier"
    var lifeCount: NSIndexPath?
    
    
    // - MARK: Action

    @IBAction func resetLifeCount(sender: UIBarButtonItem) {
        for lfe in singel.players {
            lfe.life = 20
        }
        refresh()
    }
    
    
    @IBAction func addPlayer(sender: AnyObject) {
        if singel.players.count < 6 {
            let name = "Player" + String(singel.players.count)
            let player = Player(name: name)
        
            PlayerManager.sharedPM.addPlayer(player)
            print(PlayerManager.sharedPM.players.count)
            refresh()
        }
    }
    
    // - MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc =  segue.destinationViewController as! AddPlayerView
        vc.delegate = self
        
        if let cell = sender!.superview!!.superview?.superview as? CellView {
            print("talejez")
            
            var index = self.collectionView?.indexPathForCell(cell)
            if let dest = segue.destinationViewController as? AddPlayerView {
                dest.index = index
            }
            //print(y.)
            //self.coll
        }
    }
    
   
    //MARK: - Collection View Delegate Func
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let navBarHeight = self.navigationController!.navigationBar.frame.size.height
        
        let numQuad = singel.players.count
        
        let w = collectionView.frame.width
        let h = (collectionView.frame.height - navBarHeight)
        
        if (numQuad < 4) {
            if w > h {
                return CGSize(width: w/CGFloat(numQuad) - 10, height: h - 20)
            
            } else {
                return CGSize(width: w, height: h/CGFloat(numQuad) - 20)
            }
            
        } else if (numQuad == 4) {
            return CGSize(width: collectionView.frame.width/2 - 5, height: (collectionView.frame.height - navBarHeight)/2 - 20)
        
        } else {
            if w > h {
                return CGSize(width: collectionView.frame.width/3 - 10, height: (collectionView.frame.height - navBarHeight)/2 - 20)
                
            } else {
                return CGSize(width: collectionView.frame.width/2 - 5, height: (collectionView.frame.height - navBarHeight)/3 - 20)
            }
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return singel.players.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! CellView
        cell.delegateLife = self
        
        cell.lifeScore.text = String(singel.players[indexPath.row].life)
        cell.myStepperOutlet.value = Double(singel.players[indexPath.row].life)
        
        cell.napis.text = singel.players[indexPath.row].name
        
        if let color = singel.players[indexPath.row].color {
            
            print("barvo imam")
            cell.napis.textColor = color
        } else {
            
            print("rdea bo")
            cell.napis.textColor = UIColor.flatRedColor()
        }
        
        cell.scoreView.layer.cornerRadius = 5
        cell.scoreDrtailView.layer.cornerRadius = 5
        
        
        if let notes = singel.players[indexPath.row].note {
            cell.notesTV.text = notes
        }
        
        if cell.gestureRecognizers == nil || cell.gestureRecognizers?.count == 0 {
            let recognizer = UISwipeGestureRecognizer(target: self, action: "rotateCell:")
            //recognizer.minimumPressDuration = 2.0
            
            cell.addGestureRecognizer(recognizer)
            
        }
        return cell
    }
    
    
    // MARK: - Refresh when rotate
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        refresh()
    }
    
    func rotateCell(recognizer: UIGestureRecognizer) {
        if let rec = recognizer as? UISwipeGestureRecognizer {
            if let cell = recognizer.view as? CellView {
                if rec.direction == UISwipeGestureRecognizerDirection.Right {
                    let indexPath = collectionView!.indexPathForCell(cell)!
                    
                    if (cell.showingBack) {
                        UIView.transitionFromView(cell.scoreView, toView: cell.scoreDrtailView, duration: 0.4, options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews], completion: nil)
                        cell.showingBack = false
                
                    } else {
                        UIView.transitionFromView(cell.scoreDrtailView, toView: cell.scoreView, duration: 0.4, options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews], completion: nil)
                        cell.showingBack = true
                    }
                }
            }
        }
    }
    
    func refresh() {
        print(singel.players.count)
        self.collectionView!.reloadData()
        //print("delegate dela")
    }
    
    func test(life: CellView) -> NSIndexPath {
        var index = self.collectionView?.indexPathForCell(life)
        //print("Stepper:  \(Int(life.myStepperOutlet.value))")
        singel.players[index!.row].life = Int(life.myStepperOutlet.value)
        
        self.collectionView?.reloadData()
        
        print("delegate dela")
        
        return (index)!
    }
    
    
    // MARK: - Load
    
    override func viewWillAppear(animated: Bool) {
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        bar.shadowImage = UIImage()
        bar.translucent = true
        bar.backgroundColor = UIColor.clearColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewStar = ParticleView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height))
        
        self.collectionView?.backgroundColor = UIColor.clearColor()
        
        self.collectionView?.backgroundView?.removeFromSuperview()
        self.collectionView?.backgroundView = viewStar
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refresh", name: "DeletedPlayer", object: nil)
    }
}


