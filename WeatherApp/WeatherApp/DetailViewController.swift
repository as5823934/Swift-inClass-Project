//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by ping tseng tsai on 2018-05-24.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var conditionLabel = UILabel()
    var weatherImage = UIImageView()
    var condition: String?
    var conditionImg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupText()
        setupImage()
    }
    
    
    func setupText() {

        conditionLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        conditionLabel.textAlignment = .center
        conditionLabel.text = condition
        conditionLabel.font = UIFont(name: "Avenir Next", size: 30)
        conditionLabel.backgroundColor = UIColor.white
        conditionLabel.center = view.center
        view.addSubview(conditionLabel)
    }
    
    func setupImage() {
        weatherImage.frame = CGRect(x: view.bounds.width / 4  , y: 90, width: 200, height: 200)
        weatherImage.image = UIImage(named: conditionImg!)
        
        view.addSubview(weatherImage)
    }

}
