//
//  ViewController.swift
//  MyFirstiOS
//
//  Created by ping tseng tsai on 2018-05-14.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    var myScore: Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //onCreate
        // Do any additional setup after loading the view, typically from a nib.
        // generate 2 random number for each nutton
        // when button clicked, check the right answer
        // change the score label
        generateRandomNumbers()
        
    }
    
    fileprivate func generateRandomNumbers() {
        let rand1 = arc4random_uniform(100)
        let rand2 = arc4random_uniform(100)
        leftBtn.setTitle(String(rand1), for: .normal)
        rightBtn.setTitle(String(rand2), for: .normal)
    }
    
    private func checkTheAnswer(_ rightButt: Bool){
        if let left = leftBtn.titleLabel?.text, let right = rightBtn.titleLabel?.text{
            if rightButt {
                    if Int(left)! > Int(right)! {
                        myScore += 1
                    } else {
                        myScore -= 1
                    }
            }else{
                if let left = leftBtn.titleLabel?.text, let right = rightBtn.titleLabel?.text{
                    if Int(left)! < Int(right)! {
                        myScore += 1
                    } else {
                        myScore -= 1
                    }
                }
            }
        scoreLabel.text = "Score: \(myScore)"
        }
        
    }

    @IBAction func rightBtnClicked(_ sender: UIButton) {
        checkTheAnswer(true)
        generateRandomNumbers()
    }
    
    @IBAction func leftBtnClicked(_ sender: UIButton) {
        checkTheAnswer(false)
        generateRandomNumbers()
    }
    
}

