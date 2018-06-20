//
//  CanvasView.swift
//  inClassDrawingApp
//
//  Created by ping tseng tsai on 2018-05-23.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    
    private var lastPoint: CGPoint = CGPoint.zero
    private var buffer: UIImage?
    
    var lineColor: UIColor = UIColor.black
    var lineWidth: CGFloat = 5.0
    
    
    override func awakeFromNib() {
        //when this view is created from the Interface builder
        setUpGestureRecognizer()
    }
    
    func setUpGestureRecognizer() {
        // UIGestureRecognizer (abstract)
        // pen, touch, swipe
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(handlePen))
        self.addGestureRecognizer(panGR)
    }
    
    @objc func handlePen(sender: UIPanGestureRecognizer) {
        let point = sender.location(in: self)
        switch sender.state {
        case .began:
            //started
            startAtPoint(point: point)
        case .changed:
            //moving
            continueAtPoint(point: point)
        case .ended:
            //finger off the screen
            endAtPoint(point: point)
        case .failed:
            //when something interrups
            endAtPoint(point: point)
            
        default:
            assert(false, "State not handle")
        }
    }
    
    private func drawLine(a: CGPoint, b: CGPoint, buffer: UIImage?) -> UIImage {
        let size = bounds.size
        //init full size image
       UIGraphicsBeginImageContextWithOptions(size, true, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.white.cgColor)
        context?.fill(bounds)
        
        //draw previous image buffer
        if let buffer = buffer {
            buffer.draw(in: bounds)
        }
        //draw a line
        lineColor.setStroke()
        context?.setLineWidth(lineWidth)
        context?.setLineCap(.round)
        context?.move(to: a)
        context?.addLine(to: b)
        context?.strokePath()
        
        //grap the updated buffer
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    private func startAtPoint(point: CGPoint) {
        // make starting point of my path
        lastPoint = point
    }
    
    private func continueAtPoint(point: CGPoint) {
        // moving
        autoreleasepool{
            buffer = drawLine(a: lastPoint, b: point, buffer: buffer)
            //replace the layer contents with the updated image
            layer.contents = buffer?.cgImage ?? nil
            //update the last point for next stroke
            lastPoint = point
        }
        
    }
    
    private func endAtPoint(point: CGPoint) {
        // nothing to here
        lastPoint = CGPoint.zero
    }

    override func draw(_ rect: CGRect) {
        
    }

}
