//
//  ViewController.swift
//  IOS8SwiftDraggingViewsTutorial
//
//  Created by Arthur Knopper on 27/07/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let halfSizeOfView = 25.0
        let maxViews = 25
        let insetSize = self.view.bounds.insetBy(dx: 2 * CGFloat(halfSizeOfView), dy: 2 * CGFloat(halfSizeOfView)).size
        
        // Add the Views
        for _ in 0..<maxViews {
            let pointX = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.width))))
            let pointY = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.height))))
            
            let newView = MyView(frame: CGRect.init(x: pointX, y: pointY, width: 50, height: 50))
            self.view.addSubview(newView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

