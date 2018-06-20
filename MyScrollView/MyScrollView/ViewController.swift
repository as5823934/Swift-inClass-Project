//
//  ViewController.swift
//  MyScrollView
//
//  Created by ping tseng tsai on 2018-05-29.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var contentSize = CGSize(width: 1000, height: 1600)
    let myView = MyScrollView()
    
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
            scrollView.contentSize = contentSize
            scrollView.addSubview(myView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
       
    }
}

