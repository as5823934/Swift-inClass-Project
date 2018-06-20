//
//  JapanViewController.swift
//  WeatherApp
//
//  Created by ping tseng tsai on 2018-05-24.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

class TokyoViewController: UIViewController {
    
    var conditionLabel = UILabel()
    var weatherImage = UIImageView()
    var detailBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "tokyo")!)
        navigationItem.title = "Tokyo"
        
        setupText()
        setupImage()
        setUpBtn()
        
    }
    
    func setupText() {
        
        conditionLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        conditionLabel.text = "Cloudy"
        conditionLabel.textAlignment = .center
        conditionLabel.font = UIFont(name: "Avenir Next", size: 30)
        conditionLabel.backgroundColor = UIColor.white
        conditionLabel.center = view.center
        view.addSubview(conditionLabel)
    }
    
    func setupImage() {
        weatherImage.frame = CGRect(x: view.bounds.width / 4  , y: 90, width: 200, height: 200)
        weatherImage.image = UIImage(named: "cloudy")
        
        view.addSubview(weatherImage)
    }
    
    func setUpBtn() {
        detailBtn.frame = CGRect(x: view.bounds.width / 4, y: 464 ,width: 200,height: 55);
        detailBtn.backgroundColor = UIColor.blue
        
        detailBtn.setTitle("Detail", for: .normal)
        detailBtn.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
        
        view.addSubview(detailBtn)
    }
    
    func pushToNextVC() {
        let newVC = DetailViewController()
        newVC.condition = conditionLabel.text
        newVC.conditionImg = "cloudy"
        self.navigationController?.pushViewController(newVC, animated:
            true)
    }
}
