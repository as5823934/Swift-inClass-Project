//
//  DetailViewController.swift
//  TableViewControllerDemo
//
//  Created by ping tseng tsai on 2018-05-25.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var detailViewImage: UIImageView!
    {
        didSet {
            detailViewImage.image = UIImage(named: imageName)
        }
    }
    
    @IBOutlet weak var detailNameLabel: UILabel!
    {
        didSet {
            detailNameLabel.text = nameText
        }
    }

    @IBOutlet weak var detailPositionLabel: UILabel!
    {
        didSet {
            detailPositionLabel.text = positionText
        }
    }
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var imageName: String! = "smile"
    var nameText: String! = "Hunter"
    var positionText: String! = "Developer"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   

}
