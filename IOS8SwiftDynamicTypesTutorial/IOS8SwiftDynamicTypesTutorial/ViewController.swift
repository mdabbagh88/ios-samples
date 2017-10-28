//
//  ViewController.swift
//  IOS8SwiftDynamicTypesTutorial
//
//  Created by Arthur Knopper on 13/01/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var headlineLabel:UILabel!
    @IBOutlet var subheadlineLabel:UILabel!
    @IBOutlet var bodyLabel:UILabel!
    @IBOutlet var footnoteLabel:UILabel!
    @IBOutlet var caption1Label:UILabel!
    @IBOutlet var caption2Label:UILabel!
    
    func updateFonts() {
        headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        subheadlineLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        bodyLabel.font = UIFont.preferredFont(forTextStyle: .body)
        footnoteLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        caption1Label.font = UIFont.preferredFont(forTextStyle: .caption1)
        caption2Label.font = UIFont.preferredFont(forTextStyle: .caption2)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateFonts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

