 //
 //  ViewController.swift
 //  IOS8SwiftScalingViewsTutorial
 //
 //  Created by Arthur Knopper on 08/08/14.
 //  Copyright (c) 2014 Arthur Knopper. All rights reserved.
 //
 
 import UIKit
 
 class ViewController: UIViewController {
    
    @IBAction func scaleImage(sender: UIPinchGestureRecognizer) {
        self.view.transform = self.view.transform.scaledBy(x: sender.scale, y: sender.scale)
        
        sender.scale = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 }
 
