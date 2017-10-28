//
//  SquareView.swift
//  IOS8SwiftLiveRenderingTutorial
//
//  Created by Arthur Knopper on 20/03/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

@IBDesignable

class SquareView: UIView {
    @IBInspectable var borderColor: UIColor = UIColor.blue {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // Get the Graphics Context
        let context = UIGraphicsGetCurrentContext()
        
        // Set the outerline width
        context?.setLineWidth(10)
        
        //CGContextSetLineWidth(context, lineWidth)
        
        // Set the outerline colour
        //UIColor.blueColor().set()
        
        borderColor.set()
        
        // Create square
        context?.addRect(rect)
        
        // Draw
        context?.strokePath()
    }
}
