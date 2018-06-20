//
//  DetailViewController.swift
//  InClassGallery
//
//  Created by ping tseng tsai on 2018-06-01.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedCity : City!
    @IBOutlet weak var detailLbel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         detailLbel.text = selectedCity.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
