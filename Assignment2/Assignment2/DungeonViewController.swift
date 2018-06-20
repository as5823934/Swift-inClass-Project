//
//  DungeonViewController.swift
//  Assignment2
//
//  Created by ping tseng tsai on 2018-05-17.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class DungeonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(gotoFirst))
        
    }
    
    @objc func gotoFirst() {
        navigationController?.popViewController(animated: true)
    }
}
