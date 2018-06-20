//
//  MyScrollView.swift
//  MyScrollView
//
//  Created by ping tseng tsai on 2018-05-29.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class MyScrollView: UIView {
    
    override func awakeFromNib() {
        //when this view is created from the Interface builder
        setUpGestureRecognizer()
    }
    
    func setUpGestureRecognizer() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.addGestureRecognizer(panGR)
    }
    
    @objc func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self)
    }
}
