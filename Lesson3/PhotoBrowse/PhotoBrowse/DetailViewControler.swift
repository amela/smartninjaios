//
//  DetailViewControler.swift
//  ImageView
//
//  Created by amela on 02/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    var slika : UIImage?
    var imageView : UIImageView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        imageView = UIImageView(image: slika)
        scrollView.addSubview(imageView!)
        
        scrollView.contentSize = self.view.frame.size
        
        let widthScale = self.view.frame.size.width / (imageView?.frame.size.width)!
        
        let heightScale = (self.view.frame.size.height - self.navigationController!.navigationBar.frame.height) / (imageView?.frame.size.height)!
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.maximumZoomScale = scrollView.minimumZoomScale + 3.0
        scrollView.zoomScale = 0.01
        
        let recognizer = UIRotationGestureRecognizer(target: self, action: "rotated:")
        scrollView!.addGestureRecognizer(recognizer)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
    func rotated(recognizer: UIRotationGestureRecognizer) {
        scrollView?.transform = CGAffineTransformMakeRotation(recognizer.rotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
