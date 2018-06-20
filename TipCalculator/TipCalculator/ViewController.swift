//
//  ViewController.swift
//  TipCalculator
//
//  Created by ping tseng tsai on 2018-05-24.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPersentageLabel: UILabel!
    @IBOutlet weak var calculateBtn: UIButton!
    
    private var tipPersentage: Int = 10 {
        didSet {
            if let billAmount = Double(billAmountTextField.text!){
                let tipAmount = billAmount * (Double(tipPersentage) / 100.0)
                tipAmountLabel.text = String(format: "$ %.2f", tipAmount)
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()//make keyboard dispear
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // we want the keyword to be disappeared when user tap somewhere else
        // textField has to to -> ViewController (delegate)
        //when something happend sent to viewControll
        billAmountTextField.delegate = self
        calculateBtn.layer.cornerRadius = 20
        calculateBtn.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissKeyBoard(_ sender: UITapGestureRecognizer){
        billAmountTextField.resignFirstResponder()
    }

    @IBAction func tipSliderChanged(_ sender: UISlider) {
        tipPersentage = Int(sender.value)
        tipPersentageLabel.text = "\(tipPersentage) %"
        
    }
    
    @IBAction func calcluateTip(_ sender: UIButton) {
        if let billAmount = Double(billAmountTextField.text!){
            let tipAmount = billAmount * (Double(tipPersentage) / 100.0)
            tipAmountLabel.text = String(format: "$ %.2f", tipAmount)
        }
    }
    
}

