//
//  ViewController.swift
//  IOS8SwiftScreenEdgePanGesturesTutorial
//
//  Created by Arthur Knopper on 13/01/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var imageView: UIImageView!
  
  var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
  var currentRadius:CGFloat = 0.0
  
    @objc func rotateBall(sender: UIScreenEdgePanGestureRecognizer) {
    if sender.state == .ended {
      if self.currentRadius==360.0 {
        self.currentRadius=0.0
      }
      
      UIView.animate(withDuration: 1.0, animations: {
        self.currentRadius += 90.0
        self.imageView.transform = CGAffineTransform(rotationAngle: (self.currentRadius * CGFloat.pi) / 180.0)
      })
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
                                                            action: #selector(rotateBall(sender:)))
    screenEdgeRecognizer.edges = .left
    view.addGestureRecognizer(screenEdgeRecognizer)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

