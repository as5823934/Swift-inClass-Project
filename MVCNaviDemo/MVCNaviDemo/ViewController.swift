//
//  ViewController.swift
//  MVCNaviDemo
//
//  Created by ping tseng tsai on 2018-05-17.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // every segue has id
        if segue.identifier == "first" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.data = dataTf.text
            }
        }
    }

}

