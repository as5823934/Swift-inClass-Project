//
//  DetailViewController.swift
//  PhotoGallery
//
//  Created by ping tseng tsai on 2018-05-30.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryImageView.image = image
        navigationItem.title = "Photo"
    }

    
}
