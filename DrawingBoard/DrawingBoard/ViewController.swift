//
//  ViewController.swift
//  DrawingBoard
//
//  Created by ping tseng tsai on 2018-05-22.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boardImage: UIImageView!
    var finalPoint: CGPoint!
    var isDrawing: Bool!
    var lineWidth: CGFloat = 4.0
    var lineColor: UIColor = UIColor.black
    var isEraserOn: Bool = false
    
    var red: CGFloat!
    var green: CGFloat!
    var blue: CGFloat!
    
    var toolImageView: UIImageView!
    
    
    
    enum Tools: String {
        case Brush, Eraser
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolImageView = UIImageView()
        toolImageView.frame = CGRect(x: self.view.bounds.width/2, y: self.view.bounds.height/2, width: 30, height: 30)
        toolImageView.image = UIImage(named: "Brushblack")
        view.addSubview(toolImageView)
        
        red = 0.0/255.0
        green = 0.0/255.0
        blue = 0.0/255.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = false
        if let touch = touches.first {
            finalPoint = touch.location(in: boardImage)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: boardImage)
            UIGraphicsBeginImageContext(boardImage.frame.size)
            boardImage.image?.draw(in: CGRect(x: 0, y: 0, width: boardImage.frame.size.width, height: boardImage.frame.size.height))
            let context = UIGraphicsGetCurrentContext()
            lineColor.setStroke()
            context?.move(to: CGPoint(x:finalPoint.x, y:finalPoint.y))
            context?.addLine(to: CGPoint(x:currentPoint.x, y:currentPoint.y))
            context?.setLineCap(CGLineCap.round)
            context?.setLineWidth(lineWidth)
            //context?.setStrokeColor(red: red, green: green, blue: blue, alpha: 1.0)
            context?.strokePath()
            boardImage.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            finalPoint = currentPoint
            toolImageView.center = currentPoint
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isDrawing {
            UIGraphicsBeginImageContext(boardImage.frame.size)
            boardImage.image?.draw(in: CGRect(x: 0, y: 0, width: boardImage.frame.size.width, height: boardImage.frame.size.height))
            let context = UIGraphicsGetCurrentContext()
            context?.move(to: CGPoint(x:finalPoint.x, y:finalPoint.y))
            context?.addLine(to: CGPoint(x:finalPoint.x, y:finalPoint.y))
            context?.setLineCap(CGLineCap.round)
            context?.setLineWidth(lineWidth)
            context?.setStrokeColor(red: red, green: green, blue: blue, alpha: 1.0)
            context?.strokePath()
            boardImage.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
    }

    @IBAction func draw(_ sender: UIButton) {
//        red = 0.0/255.0
//        green = 0.0/255.0
//        blue = 0.0/255.0
        isEraserOn = false
        toolImageView.image = UIImage(named: "Brushblack")
        lineColor = UIColor.black
        toolImageView.image = UIImage(named: Tools.Brush.rawValue)
        lineWidth = 4
    }
    
    @IBAction func reset(_ sender: UIButton) {
        boardImage.image = nil
    }
    
    @IBAction func Eraser(_ sender: UIButton) {
//        red = 1.0
//        green = 1.0
//        blue = 1.0
        isEraserOn = true
        lineColor = UIColor.white
        toolImageView.image = UIImage(named: Tools.Eraser.rawValue)
        lineWidth = 15
    }
    
    @IBAction func lineWidthChange(_ sender: UISlider) {
        
        lineWidth = CGFloat(sender.value)
    }
    
    
    @IBAction func RedColor(_ sender: UIButton) {
        if !isEraserOn {
            toolImageView.image = UIImage(named: "Brushred")
            lineColor = UIColor.red
        }
    }
    @IBAction func OrangeColor(_ sender: UIButton) {
        if !isEraserOn{
            toolImageView.image = UIImage(named: "Brushorange")
            lineColor = UIColor.orange
        }
    }
    @IBAction func YellowColor(_ sender: UIButton) {
        if !isEraserOn {
            toolImageView.image = UIImage(named: "Brushyellow")
            lineColor = UIColor.yellow
        }
    }
    @IBAction func GreenColor(_ sender: UIButton) {
        if !isEraserOn {
            toolImageView.image = UIImage(named: "Brushgreen")
            lineColor = UIColor.green
        }
    }
    @IBAction func BlueColor(_ sender: UIButton) {
        if !isEraserOn {
            toolImageView.image = UIImage(named: "Brushblue")
            lineColor = UIColor.blue
        }
    }
    @IBAction func PurpleColor(_ sender: UIButton) {
        if !isEraserOn {
            toolImageView.image = UIImage(named: "Brushpurple")
            lineColor = UIColor.purple
        }
    }
    @IBAction func BlackColor(_ sender: UIButton) {
        if !isEraserOn {
            toolImageView.image = UIImage(named: "Brushblack")
            lineColor = UIColor.black
        }
    }
}

