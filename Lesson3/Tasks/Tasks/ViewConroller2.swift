//
//  ViewConroller2.swift
//  Tasks
//
//  Created by amela on 01/11/15.
//  Copyright © 2015 amela. All rights reserved.
//


import UIKit

class ViewController2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Delegate var
    
    weak var delegate : SelectedImageDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var sizeImage: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!

    
    // MARK: - Actions
    
    @IBAction func close(sender: UIButton) {
        if let delegate = delegate {
            if let img = imageView.image {
                delegate.selectedImage(img)
            }
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
    @IBAction func loadImage(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - Image Picker
    
    let imagePicker = UIImagePickerController()
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
            sizeImage.text = String(imageView.image!.size.width) + "x" + String(imageView.image!.size.height)
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Other
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animateWithDuration(3.0, animations: {
            self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion: { success in
                UIView.animateWithDuration(3.0) {
                    self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI + M_PI))
                }
        })
        
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}