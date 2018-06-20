//
//  MyView.swift
//  DrawingCards
//
//  Created by ping tseng tsai on 2018-05-18.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//
//        CGFloat - Core Graphics Float
//        CGPoint - struct with two CGFloats x, y
//        CGSize - struct with two CGFloat width, height
//        CGRect - struct with a CGPoint and a CGSize, rectangle

//        var point: CGPoint = CGPoint(x: 10, y: 10)
//        var size: CGSize = CGSize(width: 100, height: 100)
//        var rectangle: CGRect = CGRect(origin: point, size: size)

//        rectangle.midX
//        rectangle.midY
//        rectangle.intersects(CGRect)

//        UIView
//        -bounds: CGRect - draw (self origin)
//        -frame: CGRect - translate, rotate, scale (its superview)
//        -center: CGPoint - translate, rotate, scale (its superview)
//        -isHidden: Bool
//        -backgroundColor: UIColor
//        -alpha: CGFloat

//         UIGraphicsGetCurrentContect() - gives a context you can use to draw in draw(CGRect)
//         UIBezierPath - easier to manage. automatically draws in the current context
//                      - has many methods
//

import UIKit
@IBDesignable
class MyView: UIView {
    
    @IBInspectable
    var content: String = "Hello floks" {
        didSet{
            label.text = content
        }
    }
    
    @IBInspectable
    var labelWidth: Int = 300
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        content = "Bye floks"
    }
    
    @IBInspectable
    var starColor: UIColor = UIColor.green
    
    let label: UILabel = UILabel(frame: CGRect(x: 33, y: 10, width: 100, height: 100))
    override func draw(_ rect: CGRect) {
        label.text = content
        
        self.addSubview(label)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 80, y: 50))
        path.addLine(to: CGPoint(x: 140, y: 150))
        path.addLine(to: CGPoint(x: 10, y: 150))
        path.close()
        UIColor.green.setFill()
        path.fill()
        
//        UIColor.red.setStroke()
//        path.lineWidth = 3.0
//        path.stroke()
        
//        path.addClip()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 10, y: 80))
        path2.addLine(to: CGPoint(x: 140, y: 80))
        path2.addLine(to: CGPoint(x: 75, y: 180))
        path2.close()
        UIColor.green.setFill()
        path2.fill()
        
//        UIColor.red.setStroke()
//        path2.lineWidth = 3.0
//        path2.stroke()
        
        
//        let path2 = UIBezierPath(roundedRect: CGRect(x: 100, y: 100, width: 100, height: 100), cornerRadius: 16)
//        UIColor.blue.setFill()
//        path2.fill()
        
//        let str = "Hello World"
//        let metrics = UIFontMetrics(forTextStyle: .body)
//        let font = UIFont(name: "Helvetica", size: 36)
//        let fontToUse = metrics.scaledFont(for: font!)
//
//        let text = NSAttributedString(string: str, attributes: [.font: fontToUse])
//        text.draw(at: CGPoint(x: 10, y: 0))
        
        
        
        
    }
    

}
