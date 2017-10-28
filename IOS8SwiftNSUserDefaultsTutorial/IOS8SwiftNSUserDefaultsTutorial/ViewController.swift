//
//  ViewController.swift
//  IOS8SwiftNSUserDefaultsTutorial
//
//  Created by Arthur Knopper on 22/02/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var bluetoothSwitch: UISwitch!

    @IBAction func saveSwitchState(sender: AnyObject) {
        let defaults = UserDefaults.standard
        
        if bluetoothSwitch.isOn {
            defaults.setValue(true, forKey: "SwitchState")
        } else {
            defaults.setValue(false, forKey: "SwitchState")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        if (defaults.object(forKey: "SwitchState") != nil) {
            bluetoothSwitch.isOn = defaults.bool(forKey: "SwitchState")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

