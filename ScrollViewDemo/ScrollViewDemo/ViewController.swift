//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by ping tseng tsai on 2018-05-29.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageURL: URL? {
        didSet {
            image = nil
            // is view on the screen or not
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set(newValue) {
            imageView.image = newValue
            imageView.sizeToFit()
            // IMPORTANT!! content size by default is 0
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            // Create a data from url
            // if url is wrong then just give url nil
            let urlContents = try? Data(contentsOf: url)
            // if this data is a image, then it will trun into image, else dont
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
        
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            // IMPORTANT!! ZOOMING
            scrollView.minimumZoomScale = 1 / 10
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            
            scrollView.addSubview(imageView)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageURL = ModelURLs.vancouver
        
    }
    

}

