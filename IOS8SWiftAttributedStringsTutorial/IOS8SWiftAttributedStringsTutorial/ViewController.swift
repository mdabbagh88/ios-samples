//
//  ViewController.swift
//  IOS8SWiftAttributedStringsTutorial
//
//  Created by Arthur Knopper on 03/12/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var attributedLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 1
    let string = "Testing Attributed Strings" as NSString
    let attributedString = NSMutableAttributedString(string: string as String)
    
    
    // 2
    let firstAttributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.blue, .backgroundColor: UIColor.yellow, .underlineStyle: 1]
    let secondAttributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.red, .backgroundColor: UIColor.blue, .strikethroughStyle: 1] as [NSAttributedStringKey : Any]
    let thirdAttributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.green, .backgroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 40)]
  
    // 3
    attributedString.addAttributes(firstAttributes, range: string.range(of: "Testing"))
    attributedString.addAttributes(secondAttributes, range: string.range(of: "Attributed"))
    attributedString.addAttributes(thirdAttributes, range: string.range(of: "Strings"))
    
    
    // 4
    attributedLabel.attributedText = attributedString
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

