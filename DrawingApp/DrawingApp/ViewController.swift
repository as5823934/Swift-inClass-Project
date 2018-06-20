//
//  ViewController.swift
//  DrawingApp
//
//  Created by ping tseng tsai on 2018-05-22.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var canvasView: UIView!
    var path = UIBezierPath()
    var touchPoint = CGPoint()
    var startingPoint = CGPoint()
    let shapeLayer = CAShapeLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.clipsToBounds = true
        canvasView.isMultipleTouchEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in:canvasView){
            startingPoint = point
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in:canvasView){
            touchPoint = point
        }
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        drawShapeLayer()
    }
    
    func drawShapeLayer() {
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = nil
        canvasView.layer.addSublayer(shapeLayer)
        canvasView.setNeedsDisplay()
    }
    
    
    
    @IBAction func clearAll(_ sender: UIButton) {
        path.removeAllPoints()
        canvasView.layer.sublayers = nil
        canvasView.setNeedsDisplay()
    }
    
    @IBAction func Earse(_ sender: UIButton) {
        
    }
    
    
    
}

