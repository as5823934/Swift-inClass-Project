//
//  SecondViewController.swift
//  MVCNaviDemo
//
//  Created by ping tseng tsai on 2018-05-17.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var data: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = data
    }

}
