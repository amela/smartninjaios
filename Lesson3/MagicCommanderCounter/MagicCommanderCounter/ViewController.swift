//
//  ViewController.swift
//  MagicCommanderCounter
//
//  Created by amela on 04/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class AddPlayerView: UIViewController, UITextViewDelegate,  UITextFieldDelegate {
    
    
    // - MARK: Def. Delegate
    
    weak var delegate : Refresh?
    
    
    // - MARK: Variables
    
    var player : Player?
    
    var index : NSIndexPath?
    
    let singel = PlayerManager.sharedPM
    
    
    // - MARK: Outlets
    
    @IBOutlet weak var noteTV: UITextView!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var saveEditedPlayer: UIButton!
    
    
    // - MARK: Actions
    
    @IBAction func deletePlayer(sender: AnyObject) {
        if singel.players.count > 0 {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                print("Cancelled")
            }
            alertController.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive) { (action) in
                //print("omg tu sem")
                self.singel.removePlayer(self.singel.players[self.index!.row])
                print(self.singel.players.count)
                self.delegate!.refresh()
                self.navigationController?.popViewControllerAnimated(true)
            }
            
            alertController.addAction(deleteAction)
            
            self.presentViewController(alertController, animated: true) {
                print("bla")
            }
            //NSNotificationCenter.defaultCenter().postNotificationName("DeletedPlayer", object: nil)
        }
    }
    
    @IBAction func saveEditedPlayer(sender: UIButton) {
        if nameText != nil || nameText.text != "" {
            print("shranil sem")
            singel.players[index!.row].name = nameText.text!
            singel.players[index!.row].note = noteTV.text
            
            delegate?.refresh()
        }
    }
    
    @IBAction func colorButtons(sender: UIButton) {
        print(sender.titleLabel!.text!)
        
        let text = sender.titleLabel!.text!
        
        switch(text) {
        case "R":
            singel.players[index!.row].color = UIColor.flatRedColor()
        case "G":
            //print("zelena")
            singel.players[index!.row].color = UIColor.flatGreenColor()
        case "B":
            singel.players[index!.row].color = UIColor.flatBlueColor()
        case "W":
            singel.players[index!.row].color = UIColor.flatSandColor()
        case "K":
            singel.players[index!.row].color = UIColor.flatGrayColorDark()
        default:
            //print(sender.titleLabel!.text! == "G")
            break
            
        }
    }

    @IBAction func editPlayerButton(sender: UIButton) {
        let name = nameText.text
        let player = Player(name: name!)
        
        PlayerManager.sharedPM.addPlayer(player)
        print(PlayerManager.sharedPM.players.count)
        
        delegate!.refresh()
        
        print("done")
    }
    
    
    // - MARK: Delegate Functions
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // - MARK: Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (index != nil) {
            print("prenesel index")
        }
        
        player = singel.players[index!.row]
        
        nameText.text = player!.name
        
        self.noteTV.delegate = self
        self.nameText.delegate = self
        
        cancelButton.layer.cornerRadius = 5
        saveEditedPlayer.layer.cornerRadius = 5
        
        noteTV.layer.cornerRadius = 0.0
        noteTV.layer.masksToBounds = true
        noteTV.layer.borderColor = UIColor.flatBlackColor().CGColor
        noteTV.layer.borderWidth = 1.0
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.barStyle =  UIBarStyle.Black
        bar.translucent = false
    }
}

