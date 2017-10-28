//
//  MyView.swift
//  IOS8SwiftDraggingViewsTutorial
//
//  Created by Arthur Knopper on 27/07/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class MyView: UIView {
    var lastLocation:CGPoint = CGPoint.zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        let panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(detectPan(recognizer:)))
        self.gestureRecognizers = [panRecognizer]
        
        //randomize view color
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        
        self.backgroundColor = UIColor(red:redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translation(in: self.superview!)
        self.center = CGPoint.init(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
    }
    
    /*override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
     // Promote the touched view
     self.superview?.bringSubviewToFront(self)
     
     // Remember original location
     lastLocation = self.center
     }*/
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Promote the touched view
        self.superview?.bringSubview(toFront: self)
        
        // Remember original location
        lastLocation = self.center
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect)
     {
     // Drawing code
     }
     */
    
}

