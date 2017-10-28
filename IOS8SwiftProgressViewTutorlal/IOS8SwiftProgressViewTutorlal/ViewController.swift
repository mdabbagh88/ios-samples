//
//  ViewController.swift
//  IOS8SwiftProgressViewTutorlal
//
//  Created by Arthur Knopper on 30/07/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var progressLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  
  var counter:Int = 0 {
  didSet {
    let fractionalProgress = Float(counter) / 100.0
    let animated = counter != 0
    
    progressView.setProgress(fractionalProgress, animated: animated)
    progressLabel.text = ("\(counter)%")
    }
  }
  
  @IBAction func startCount(sender: UIButton) {
    progressLabel.text = "0%"
    self.counter = 0
    for _ in 0..<100 {
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            DispatchQueue.main.async {
                self.counter += 1
                return
            }
        }
    }
  }
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    
    progressView.setProgress(0, animated: true)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

