//
//  CityViewController.swift
//  Assignment 5
//
//  Created by ping tseng tsai on 2018-05-30.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    var cityInfo: City?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch cityInfo?.name {
        case "Vancouver":
            view.backgroundColor = UIColor(patternImage: UIImage(named: "vancouver")!)
        case "London":
            view.backgroundColor = UIColor(patternImage: UIImage(named: "taipei")!)
        case "New York":
            view.backgroundColor = UIColor(patternImage: UIImage(named: "seoul")!)
        case "Hong Kong":
            view.backgroundColor = UIColor(patternImage: UIImage(named: "surrey")!)
        case "Tokyo":
            view.backgroundColor = UIColor(patternImage: UIImage(named: "tokyo")!)
        default:
            0
        }
        
    }
    
    override func viewDidLoad() {
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "taipei")!)
        
        let temperaturLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        temperaturLabel.text = String(cityInfo!.temperature)
        temperaturLabel.center = view.center
        temperaturLabel.backgroundColor = UIColor.cyan
        temperaturLabel.textAlignment = .center
        view.addSubview(temperaturLabel)
        
        let weatherImg = UIImageView()
        weatherImg.frame = CGRect(x: view.bounds.width/2 - 50, y: 100, width: 100, height: 100)
        weatherImg.image = cityInfo?.weatherimage
        view.addSubview(weatherImg)

        
        let detailBtn = UIButton(frame: CGRect(x: view.bounds.width/2 - 50, y: view.bounds.height/2 + 100, width: 100, height: 50))
        detailBtn.backgroundColor = UIColor.blue
        detailBtn.titleLabel?.text = "Detail"
        detailBtn.addTarget(self, action: #selector(goToDetailVC), for: .touchUpInside)
        
        view.addSubview(detailBtn)
    }
    
    @objc func goToDetailVC() {
        let detailVC = DetailViewController()
        detailVC.title = "Weather Detail For \(cityInfo!.name)"
        detailVC.cityInfo = cityInfo
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    

}
