//
//  CellView.swift
//  MagicCommanderCounter
//
//  Created by amela on 10/12/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation
import UIKit


class CellView: UICollectionViewCell, UITextFieldDelegate {
    
    //MARK: - Delegate
    
    weak var delegateLife: CellIndexProtocol?
    
    
    //MARK: - Variable
    
    var showingBack = true
    
    
    //MARK: - Outleti
    
    @IBOutlet weak var myStepperOutlet: UIStepper!
    @IBOutlet weak var lifeScore: UILabel!
    @IBOutlet weak var napis: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var scoreDrtailView: UIView!
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var notesTV: UITextView!
    
    
    //MARK: - Actions
    
    @IBAction func myStepper(sender: UIStepper) {
        //print(sender.value)
        delegateLife?.test(self)
    }
    
    
    
    /*
    @IBAction func startClick(sender: UIButton) {
    if (showingBack) {
    UIView.transitionFromView(self.scoreView, toView: self.scoreDrtailView, duration: 0.4, options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews], completion: nil)
    showingBack = false
    
    } else {
    UIView.transitionFromView(self.scoreDrtailView, toView: self.scoreView, duration: 0.4, options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews], completion: nil)
    showingBack = true
    }
    }
    */
    
    
    //MARK: - TextField Delegate Functions
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
        renameLabel()
    }
    
    
    //MARK: - TextField and Label switch
    
    func lblTapped() {
        napis.hidden = true
        editName.hidden = false
        editName.text = napis.text
    }

    
    func renameLabel () {
        editName.hidden = true
        napis.hidden = false
        napis.text = editName.text
    }
    
    
    //MARK: - Init / Load
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        editName.delegate = self
        
        myStepperOutlet.value = 10
        lifeScore.text = String(Int(myStepperOutlet.value))
        
        editName.hidden = true
        napis.userInteractionEnabled = true
        let aSelector : Selector = "lblTapped"
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        napis.addGestureRecognizer(tapGesture)
    }
}
