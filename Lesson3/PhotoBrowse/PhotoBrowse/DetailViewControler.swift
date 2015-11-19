//
//  DetailViewControler.swift
//  ImageView
//
//  Created by amela on 02/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var slika : UIImage?
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = slika
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
