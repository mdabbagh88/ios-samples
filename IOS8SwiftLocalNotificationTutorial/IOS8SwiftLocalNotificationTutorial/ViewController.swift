//
//  ViewController.swift
//  IOS8SwiftLocalNotificationTutorial
//
//  Created by Arthur Knopper on 27/01/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func sendNotification(sender: UIButton) {
        let localNotification = UILocalNotification()
        localNotification.fireDate = Date.init(timeIntervalSinceNow: 5)
        localNotification.alertBody = "new Blog Posted at iOScreator.com"
        localNotification.timeZone = TimeZone.current
        localNotification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

